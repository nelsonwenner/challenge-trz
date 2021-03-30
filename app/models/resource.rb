class Resource < ApplicationRecord
  belongs_to :survivor
  belongs_to :item

  validates_uniqueness_of :survivor_id, :scope => [:item_id], message: 'Unique pair resource keys'

  validates_presence_of :quantity
  validates_numericality_of :quantity, greater_than_or_equal_to: 0, only_integer: true
end
