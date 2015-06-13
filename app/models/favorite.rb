class Favorite < ActiveRecord::Base
  validates :spot_id, presence: true
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :spot
end
