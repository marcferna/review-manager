class Importer::Ios < Importer::Base
  def initialize(app:)
    self.app = app
    self.feed = Criticism::Ios::Feed.new(app_id: app.uid)
  end

  def import
    parse_page(page: feed.page)
  end

  private

  attr_accessor :feed

  def parse_page(page:)
    return if page.entries.empty?
    page.entries.each do |entry|
      # TODO: Add index to Review uid
      return if review?(entry: entry)
      # TODO: Find author by id
      # TODO: Add index to author finding field
      author = Author.find_or_create_by(name: entry.author.name) do |new_author|
        new_author.uri = entry.author.uri
      end
      create_review(entry: entry, author: author)
    end
    parse_page(page: page.next)
  end

  def review?(entry:)
    Review.find_by(uid: entry.id).present?
  end
end
