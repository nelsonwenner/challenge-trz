class Item < ApplicationRecord
  #Indicating the class where this model is referenced, you can apply
  #joins to other references in this target table and apply conditions.
  has_many :not_infected_resources, -> { 
    joins(:survivor).where(survivors: { infected: false })
  }, class_name: 'Resource'

  validates_presence_of :name, :value
  validates_numericality_of :value, greater_than_or_equal_to: 0, only_integer: true
end
