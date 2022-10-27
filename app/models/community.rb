class Community < ApplicationRecord
    has_many :topics
    # has_many: relationships, through: :topics
    has_many :mentors
    has_many :mentees
end
