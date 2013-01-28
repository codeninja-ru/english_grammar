#!/bin/sh

rm ../_posts/*.md
ruby parse.rb golits1-25_article.html answers1_50.html "article" "2013-01-28" 1
ruby parse.rb golits1-26-40_article.html answers1_50.html "article" "2013-01-27" 1
ruby parse.rb golits41-51_use_articles_in_set_phrases.html answers1_50.html "article" "2013-01-26" 1
ruby parse.rb golits52-75_other_another.html answers50_100.html "article" "2013-01-25" 1
ruby parse.rb golits76-81_insert_article.html answers50_100.html "article" "2013-01-24" 1
