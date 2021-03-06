require 'nokogiri'
require 'date'

file_name = ARGV.first
answer_file_name = ARGV[1]
category = ARGV[2]
date = Date.parse(ARGV[3])
start_num = ARGV[4].to_i

def clean(body)
  def clean_em(em)
    em.xpath('//@class').remove
    em.xpath('//@syle').remove
    em.xpath('//@color').remove
  end
  body.css("span").each { |node| clean_em(node) }
  body.css("table").each { |node| clean_em(node) }
  body.css("p").each { |node| clean_em(node) }
end

if ARGV.length == 5 then
  questions = Nokogiri::HTML(open(file_name), nil, 'UTF-8')
  clean(questions)

  idx = start_num
  slice = questions.css('body').first.children.group_by do |node|
    case node.name
    when 'span', 'table'
      idx += 1 
    when 'h2'
      idx += 1
    when 'text', 'br'
      # do nothing
    else
      puts "unexpcted tag #{node.name}\n"
    end
    idx
  end

  answers = Nokogiri::HTML(open(answer_file_name), nil, 'UTF-8')
  clean(answers)
  idx = start_num
  answers = answers.css('body').first.children.group_by do |node|
    if node.name == 'h2' then
      id = node['id']
      id['a'] = ''
      idx = id.to_i
    end
    idx
  end

  sort_idx = comment_idx = post_idx = start_num - 1
  slice.each do |idx, em|
    content = em.map { |n| n.to_html } * ''
    content.strip!
    unless content.empty? 
      case em.first.name
      when 'span', 'table', 'p', 'text'
        type = "Comment"
        idx = comment_idx += 1
        layout = "span"
        title = ""
        text = "<section class='rules'>#{content}</section>"
      when 'h2'
        type = "Post"
        post_idx += 1
        layout = "post"
        title = em.first.content

        id = em.first['id']
        id['a'] = ''
        id = id.to_i
        idx = id

        em.delete_at(0)
        content = em.map { |n| n.to_html } * ''
        content.strip!
        text = "<section class=\"question\">\n#{content}\n</section>"

        ans = answers[id].keep_if { |n| n.name != 'h2' }
        ans = answers[id].map { |n| n.name == 'p' ? n.content : n.to_html } * ''
        ans = "<section class=\"answer\">\n#{ans.strip}\n</section>"
        text += "\n\n"
        text += ans
      else
        puts "unknown block #{em.first.name}\n"
        type = "Unknown"
        layout = ""
        title = ""
        text = content
      end
      post_file_name = date.strftime("%Y-%m-%d-#{'%03d' % (999 - sort_idx)}-#{type}-#{idx}.md")
      sort_idx += 1

      output = "---\n"
      output += "layout: #{layout}\n"
      output += "title: \"#{title}\"\n"
      output += "category: \"#{category}\"\n"
      output += "---\n"
      output += text

      puts post_file_name

      IO.write("../_posts/#{post_file_name}", output)
    end
  end
end
