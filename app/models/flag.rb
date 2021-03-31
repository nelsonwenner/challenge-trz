class Flag < ApplicationRecord
  belongs_to :flagger, class_name: 'Survivor', foreign_key: 'flagger_id'
  belongs_to :flagged, class_name: 'Survivor', foreign_key: 'flagged_id'

  validates_uniqueness_of :flagger_id, :scope => [:flagged_id], message: 'Unique pair flag, A survivor cannot flagger the same flagged twice.'

  after_save :check_flaggers_received
  validate :check_self_flag

  private

  def check_self_flag
    if self.flagger_id == self.flagged_id
      self.errors.add(:flag, 'You cannot self-flag')  
    end
  end

  def check_flaggers_received
    if self.flagged.flags_target.count >= 5
      self.flagged.update({infected: true})
    end
  end
end
