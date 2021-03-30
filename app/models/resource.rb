class Resource < ApplicationRecord
  belongs_to :survivor, class_name: 'Survivor', foreign_key: 'survivor_id'
  belongs_to :item, class_name: 'Item', foreign_key: 'item_id'

end
