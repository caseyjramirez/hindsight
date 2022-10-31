class Relationship < ApplicationRecord
  belongs_to :topic
  belongs_to :community
  belongs_to :mentee, class_name: "User"
  belongs_to :mentor, class_name: "User"

  def posting
    "hello"
  end
  
  def user
    "hello"
  end
end
