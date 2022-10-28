class ApplicationSerializer < ActiveModel::Serializer
  attributes :id, :description, :isRejected, :isAccepted
  has_one :posting
  has_one :user
end
