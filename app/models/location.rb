class Location < ApplicationRecord
  belongs_to :survivor, class_name: 'Survivor', foreign_key: 'survivor_id'

  MAX_LATITUDE = 90
  MIN_LATITUDE = -90
  MAX_LONGITUDE = 180
  MIN_LONGITUDE = -180

  validates_presence_of :latitude, :longitude

  validates_numericality_of :latitude, greater_than_or_equal_to: MIN_LATITUDE, less_than_or_equal_to: MAX_LATITUDE
  validates_numericality_of :longitude, greater_than_or_equal_to: MIN_LONGITUDE, less_than_or_equal_to: MAX_LONGITUDE
end
