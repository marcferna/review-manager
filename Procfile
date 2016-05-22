web: bundle exec puma -C config/puma.rb
resque_scheduler: bundle exec rake environment resque:scheduler
importer: QUEUE=importer bundle exec rake environment resque:work
