class Location < ApplicationRecord
  belongs_to :survivor

  validates_presence_of :latitude, :longitude

  validates_numericality_of :latitude, greater_than_or_equal_to: -90, less_than_or_equal_to: 90
  validates_numericality_of :longitude, greater_than_or_equal_to: -180, less_than_or_equal_to: 180
end
