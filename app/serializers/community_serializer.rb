class CommunitySerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :state, :description
  has_many :users
end
