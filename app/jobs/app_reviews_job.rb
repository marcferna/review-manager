class AppReviewsJob
  @queue = :app_reviews

  def self.perform
    App::Ios.all.each do |app|
      feed = Criticism::Ios::Feed.new(app_id: app.uid)
      parse_page(app, feed.page)
    end
  end

  def self.parse_page(app, page)
    return if page.entries.empty?
    page.entries.each do |entry|
      # TODO: Add index to Review uid
      next if review?(entry)
      # TODO: Find author by id
      # TODO: Add index to author finding field
      author = Author.find_or_create_by(name: entry.author.name) do |new_author|
        new_author.uri = entry.author.uri
      end
      create_review(app, entry, author)
    end
    parse_page(app, page.next)
  end

  def self.review?(entry)
    Review.find_by(uid: entry.id).present?
  end

  def self.create_review(app, entry, author)
    Review.create!(
      app_id:    app.id,
      uid:       entry.id,
      title:     entry.title,
      text:      entry.text,
      rating:    entry.rating,
      version:   entry.version,
      author_id: author.id
    )
  end
end
