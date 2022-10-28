class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :age, :email, :phone_number, :description, :password_digest, :profile_photo
  has_one :user_type
  has_one :community_id
end
