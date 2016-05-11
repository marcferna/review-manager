class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Relationships
  belongs_to :organization

  # Delegations
  delegate :apps, to: :organization

  # Validations
  validates :organization, presence: true

  # Attributes
  accepts_nested_attributes_for :organization
end
