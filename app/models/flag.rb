class Flag < ApplicationRecord
  belongs_to :flagger, class_name: 'Survivor', foreign_key: 'flagger_id'
  belongs_to :flagged, class_name: 'Survivor', foreign_key: 'flagged_id'

  validates_uniqueness_of :flagger_id, :scope => [:flagged_id], message: 'Unique pair flag, A survivor cannot flagger the same flagged twice.'
end
