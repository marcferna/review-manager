class Integration::Slack < ActiveRecord::Base
  self.table_name = :slack_integrations

  # Relationships
  belongs_to :organization

  # Validations
  validates :organization, :webhook_url, :channel, presence: true

  def notify(review)
    self.review = review
    notifier.ping(text, attachments: [attachment])
  end

  private

  # Attributes
  attr_accessor :review

  def notifier
    Slack::Notifier.new(
      webhook_url,
      channel:  channel,
      username: username
    )
  end

  def app
    review.app
  end

  def username
    'Review Manager'
  end

  def text
    "<!channel> New review for *#{app.name}* #{app.decorate.type}!"
  end

  def attachment
    {
      author_icon: attachment_icon,
      author_name: attachment_title,
      text:        attachment_text,
      color:       color,
      fields:      attachment_fields
    }
  end

  def attachment_icon
    # app.icon_url
  end

  def attachment_title
    review.title
  end

  def attachment_text
    review.text
  end

  def color
    case review.rating
    when 4..5
      'good'
    when 3
      'warning'
    else
      'danger'
    end
  end

  def star_rating
    '★' * review.rating + '☆' * (Review::MAX_RATING - review.rating)
  end

  def attachment_fields
    [rating_field, version_field, author_field].compact
  end

  def rating_field
    {
      title: 'Rating',
      value: star_rating,
      short: true
    }
  end

  def version_field
    {
      title: 'Version',
      value: review.version.to_s,
      short: true
    }
  end

  def author_field
    if review.author.try(:name).present?
      {
        title: 'Author',
        value: review.author.name,
        short: false
      }
    end
  end
end
