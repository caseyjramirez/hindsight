class MentorSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :role, :email, :phone_number
  belongs_to :community
  has_many :relationships

  def role
    "Mentor"
  end
end
