class Mentor < ApplicationRecord
  belongs_to :community
  has_many :relationships
  has_many :mentees, through: :relationships
  has_many :applications, through: :relationships
  has_many :applicants, through: :applications
  
  has_secure_password
  # validates :password, confirmation: :true
  # validates_presence_of :first_name, :last_name, :email, :community_id, :password
  # validates_uniqueness_of :email
end
