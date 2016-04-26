class AppReviewsJob
  @queue = :app_reviews

  def self.perform
    App.all.each do |app|
      feed = Criticism::Feed.new(app_id: app.uid)
      parse_page(app, feed.page)
    end
  end

  def self.parse_page(app, page)
    return if page.entries.empty?
    page.entries.each do |entry|
      # TODO - Add index to Review uid
      return if Review.find_by(uid: entry.id).present?
      # TODO - Find author by id
      # TODO - Add index to author finding field
      author = Author.find_or_create_by(name: entry.author.name) do |author|
        author.uri = entry.author.uri
      end

      Review.create!(
        app_id:    app.id,
        uid:       entry.id,
        title:     entry.title,
        text:      entry.review,
        rating:    entry.rating,
        version:   entry.version,
        author_id: author.id
      )
    end

    self.parse_page(app, page.next)
  end
end
