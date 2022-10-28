class Posting < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  belongs_to :community
  has_many :applications
  has_many :users, through: :applications
end
