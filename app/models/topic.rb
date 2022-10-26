class Topic < ApplicationRecord
  belongs_to :community
  has_many :topics
  
end
