class RelationshipSerializer < ActiveModel::Serializer
  attributes :id, :mentor, :mentee, :topic, :description, :community

  belongs_to :user

  def mentor
    mentor = User.find_by_id(object.mentor_id)
    {
      first_name: mentor.first_name,
      last_name: mentor.last_name
    }
  end

  def mentee
    mentee = User.find_by_id(object.mentee_id)
    {
      first_name: mentee.first_name,
      last_name: mentee.last_name
    }
  end
end
