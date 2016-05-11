class App < ActiveRecord::Base
  # Relationships
  belongs_to :organization
  has_many :reviews

  # Validations
  validates :user_id, :name, :type, presence: true
end
