release: bin/rake heroku:release
web: STATEMENT_TIMEOUT=30s bundle exec puma -C config/puma.rb
worker: STATEMENT_TIMEOUT=600s bundle exec sidekiq -e production -C config/sidekiq.yml
