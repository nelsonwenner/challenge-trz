require 'rails_helper'

RSpec.describe Flag, type: :model do
  describe 'Associations' do
    it { 
      should belong_to(:flagger)
      .class_name('Survivor')
      .with_foreign_key('flagger_id')  
    }
    it { 
      should belong_to(:flagged)
      .class_name('Survivor')
      .with_foreign_key('flagged_id')  
    }
  end

  describe 'Uniqueness' do
    subject { create(:flag) }
  
    it { 
      should validate_uniqueness_of(:flagger_id)
      .scoped_to(:flagged_id)
      .with_message('Unique pair flag, A survivor cannot flagger the same flagged twice.') 
    }
  end
end
