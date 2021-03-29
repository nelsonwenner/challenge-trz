class Flag < ApplicationRecord
  belongs_to :flagger, class_name: 'Survivor', foreign_key: 'flagger_id'
  belongs_to :flagged, class_name: 'Survivor', foreign_key: 'flagged_id'

end
