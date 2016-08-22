class Review < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user
  validates :user, presence: true
end
