class Review < ActiveRecord::Base
  # cool to use reviews as a join model!
  belongs_to :restaurant
  belongs_to :user
  validates :user, presence: true
end
