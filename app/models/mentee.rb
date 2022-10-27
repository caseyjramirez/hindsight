class Mentee < ApplicationRecord
  belongs_to :community
  has_many :relationships
  has_many :mentors, through: :relationships
  has_many :applications

  has_secure_password
  validates :password, confirmation: :true
end
