class Review < ActiveRecord::Base
  # Relationships
  belongs_to :app
  belongs_to :author

  # Callbacks
  after_create :notify

  # Delegations
  delegate :organization, to: :app

  # Constants
  MAX_RATING = 5

  def notify
    organization.slack_integration.try(:notify, self)
  end
end
