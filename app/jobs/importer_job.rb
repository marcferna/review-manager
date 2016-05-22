class ImporterJob
  @queue = :importer

  def self.perform
    App::Ios.all.each { |app| Importer::Ios.new(app: app).import }
  end
end
