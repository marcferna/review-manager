namespace :importer do
  task run: :environment do
    Resque.redis = ENV['REDIS_URL'] || 'redis://127.0.0.1:6379'
    Resque.enqueue(ImporterJob)
  end
end
