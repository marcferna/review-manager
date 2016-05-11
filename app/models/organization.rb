class Organization < ActiveRecord::Base
  # Relationships
  has_many :users
  has_many :apps

  # Validations
  validates :name, presence: true
end
