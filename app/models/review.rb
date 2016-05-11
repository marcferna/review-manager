class Review < ActiveRecord::Base
  # Relationships
  belongs_to :app
  belongs_to :author

  # Delegations
  delegate :organization, to: :app

  # Constants
  MAX_RATING = 5
end
