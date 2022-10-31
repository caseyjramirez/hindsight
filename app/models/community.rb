class Community < ApplicationRecord
    has_many :topics
    has_many :relationships
    has_many :users
end
