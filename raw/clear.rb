require 'nokogiri'

file_name = ARGV.first
if !file_name.nil? then

  doc = Nokogiri::HTML(open(file_name), nil, 'UTF-8')
  doc.css("script").remove
  doc.css("form").remove
  doc.css("input").remove
  doc.css("a").remove
  doc.css("span").each { |node| node['class'] = 'rules' }
  doc.css("h2").each do |node|
    node.content = node.content.strip
    node.content = node.content.lines.map { |item| item.strip }.join(" ")
  end

  doc.css("body").first.children { |node| puts node.class }

  IO.write(file_name, doc.to_html)
end
