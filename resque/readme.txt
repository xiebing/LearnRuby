http://rubylearning.com/blog/2010/11/08/do-you-know-resque/

start worker
    rake resque:work QUEUE=word_analysis

ruby idea_analyzer.rb aa bb cc

resque-web


in rails:

    put

    task(“resque:setup” => :environment)

    in rake file

    or
        rake environment resque:work QUEUE=*

`COUNT=20 QUEUE=* bundle exec rake resque:workers`