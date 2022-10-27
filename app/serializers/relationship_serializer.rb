class RelationshipSerializer < ActiveModel::Serializer
  attributes :id, :description, :isEstablished, :mentee, :community
  belongs_to :topic
  # belongs_to :mentee
  belongs_to :community

  def mentee
    Mentee.find_by(id: object.mentee_id)
  end
end
