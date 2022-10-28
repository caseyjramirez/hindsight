class User < ApplicationRecord
  belongs_to :user_type
  belongs_to :community
  has_many :relationships
  has_many :postings
  has_many :applications, through: :postings

  has_secure_password
end
