#!/bin/sh

rm ../_posts/*.md
ruby parse.rb golits1-25_article.html answers1_50.html "article" "2013-01-28" 1
ruby parse.rb golits1-26-40_article.html answers1_50.html "article" "2013-01-27" 1
ruby parse.rb golits41-51_use_articles_in_set_phrases.html answers1_50.html "article" "2013-01-26" 1
ruby parse.rb golits52-75_other_another.html answers50_100.html "article" "2013-01-25" 1
ruby parse.rb golits76-81_insert_article.html answers50_100.html "article" "2013-01-24" 1
ruby parse.rb golits_noun_82_94.html answers50_100.html "noun" "2013-01-23" 1
ruby parse.rb some_any_no_every_95_103.html answers_95_150.html "some any no every" "2013-01-22" 1
ruby parse.rb some_any_no_every_104_114.html answers_95_150.html "some any no every" "2013-01-22" 100
ruby parse.rb much_many_115_123.html answers_95_150.html "much many" "2013-01-21" 1
ruby parse.rb adjective_comparison_124_136.html answers_95_150.html "adjective comparsion" "2013-01-20" 1
ruby parse.rb preposition_137_144.html answers_95_150.html "preposition" "2013-01-19" 1
ruby parse.rb preposition_145_155.html answers_95_150.html "preposition" "2013-01-19" 100
