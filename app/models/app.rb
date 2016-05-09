class App < ActiveRecord::Base
  # Scopes
  belongs_to :user
  has_many :reviews

  # Validations
  validates :user_id, :name, :type, presence: true
end
