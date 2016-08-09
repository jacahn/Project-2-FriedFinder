class Review < ActiveRecord::Base
  belongs_to :restaurant

  validates :reviewer, presence: true
end
