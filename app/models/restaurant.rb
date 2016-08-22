class Restaurant < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_many :users, :through => :reviews
  validates :name, presence: true
end
