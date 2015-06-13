class Favorite < ActiveRecord::Base
  validates :spot_id, presence: true
  validates :user_id, presence: true

  has_many :users
  has_many :spots
end
