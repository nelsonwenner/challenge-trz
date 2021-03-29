class Location < ApplicationRecord
  belongs_to :survivor, class_name: 'Survivor', foreign_key: 'survivor_id'
end
