class Review < ActiveRecord::Base
  belongs_to :app
  belongs_to :author
end
