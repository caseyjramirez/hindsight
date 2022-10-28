class PostingSerializer < ActiveModel::Serializer
  attributes :id, :description, :isFilled
  has_one :user
  has_one :topic
  has_one :community
end
