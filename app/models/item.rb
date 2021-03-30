class Item < ApplicationRecord
  validates_presence_of :name, :value
  validates_numericality_of :value, greater_than_or_equal_to: 0, only_integer: true
end
