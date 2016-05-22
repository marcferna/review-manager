namespace :importer do
  task run: :environment do
    Resque.enqueue(ImporterJob)
  end
end
