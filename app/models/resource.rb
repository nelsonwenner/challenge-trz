class Resource < ApplicationRecord
  belongs_to :survivor, class_name: 'Survivor', foreign_key: 'survivor_id'
  belongs_to :item, class_name: 'Item', foreign_key: 'item_id'

  validates_uniqueness_of :survivor_id, :scope => [:item_id], message: 'Unique pair resource keys'

  validates_presence_of :quantity
  validates_numericality_of :quantity, greater_than_or_equal_to: 0, only_integer: true
end
