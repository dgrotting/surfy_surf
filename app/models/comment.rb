class Comment < ActiveRecord::Base
  validates :body, presence: true
  validates :spot_id, presence: true
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :spot
end
