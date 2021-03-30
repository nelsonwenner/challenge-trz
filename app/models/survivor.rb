class Survivor < ApplicationRecord
  has_one :location, class_name: 'Location', foreign_key: 'survivor_id'
  has_many :resources, class_name: 'Resource', foreign_key: 'survivor_id'

end
