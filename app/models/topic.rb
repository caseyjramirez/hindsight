class Topic < ApplicationRecord
  belongs_to :community
  has_many :relationships
  
end
