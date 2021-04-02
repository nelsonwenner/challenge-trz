class SurvivorSerializer < ActiveModel::Serializer
  attributes :id, :infected, :name, :age, :gender, :location, 
             :resources, :created_at, :updated_at

  def resources
    object.resources.as_json(include: :item)
  end
end
