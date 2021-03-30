class SurvivorSerializer < ActiveModel::Serializer
  attributes :id, :infected, :name, :age, :gender, :created_at, :updated_at

  has_one :location
  has_many :resources
end
