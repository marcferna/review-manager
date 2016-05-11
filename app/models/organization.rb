class Organization < ActiveRecord::Base
  # Relationships
  has_many :users
  has_many :apps
  has_one :slack_integration, class_name: 'Integration::Slack'

  # Validations
  validates :name, presence: true
end
