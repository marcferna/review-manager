module Importer
  class Base
    def import
      raise NotImplementedError
    end

    protected

    attr_accessor :app

    def create_review(entry:, author: nil)
      Review.create!(
        app_id:    app.id,
        uid:       entry.id,
        title:     entry.title,
        text:      entry.text,
        rating:    entry.rating,
        version:   entry.version,
        author_id: author.try(:id)
      )
    end
  end
end
