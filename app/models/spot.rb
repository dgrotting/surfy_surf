class Spot < ActiveRecord::Base
  validates :name, presence: true
  validates :script, presence: true

  has_many :users, through: :favorites
  has_many :comments
end
