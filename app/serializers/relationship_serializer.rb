class RelationshipSerializer < ApplicationSerializer
  attributes :id, :mentor, :mentee, :description
  has_one :topic
  has_one :community
end
