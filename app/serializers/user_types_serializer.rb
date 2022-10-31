class UserTypesSerializer < ActiveModel::Serializer
  attributes :id

  has_many :users
end
