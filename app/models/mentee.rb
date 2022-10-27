class Mentee < ApplicationRecord
  belongs_to :community
  has_many :relationships
  has_many :mentors, through: :relationships
  has_many :applications

  has_secure_password
  # validates :password, confirmation: :true
  # validates_presence_of :first_name, :last_name, :email, :community_id, :password
  # validates_uniqueness_of :email
end
