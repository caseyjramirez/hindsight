class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :community, :relationships, :user_type, :phone_number, :email, :posting, :application

  belongs_to :community
  has_many :relationships

  def relationships
    if object.user_type.name == 'mentor'
      Relationship.where(mentor_id: object.id)
    else
      Relationship.where(mentee_id: object.id)
    end
  end

  def posting
    if object.user_type.name == 'mentor'
      Posting.where(user_id: object.id)
    else
      nil
    end
  end

  def application
    if object.user_type.name == 'mentor'
      nil
    else
      Application.where(user_id: object.id)
    end
  end

  # def community 
  #   community = Community.find_by_id(object.community)
    
  #   {
  #     name: community.name
  #     city: community.city
  #   }
  # end
end
