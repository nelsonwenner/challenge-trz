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

  describe 'Validations' do
    let(:subject_self_flag) { Flag.create(flagger_id: 1, flagged_id: 1) }
    let(:subject_infected) { Flag.create(flagger_id: 3, flagged_id: 1) }

    it 'Should not self-flag' do
      expect(subject_self_flag.errors.messages).to eq({
        'flag': ['You cannot self-flag']
      })
    end

    it 'Should no signal, survivor infected' do
      expect(subject_infected.errors.messages).to eq({
        'flag': ['An infected survivor cannot signal']
      })
    end
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
