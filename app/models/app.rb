class App < ActiveRecord::Base
  # Relationships
  belongs_to :organization
  has_many :reviews

  # Validations
  validates :name, :type, :organization, presence: true
end
