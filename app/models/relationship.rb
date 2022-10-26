class Relationship < ApplicationRecord
  belongs_to :mentor
  belongs_to :mentee
  belongs_to :topic
  belongs_to :community
  has_many :applications
  has_many :applicants, through: :applications   
end
