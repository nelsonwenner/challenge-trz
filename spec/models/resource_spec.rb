require 'rails_helper'

RSpec.describe Resource, type: :model do
  describe 'Associations' do
    it { 
      should belong_to(:survivor)
      .class_name('Survivor')
      .with_foreign_key('survivor_id')  
    }
    it { 
      should belong_to(:item)
      .class_name('Item')
      .with_foreign_key('item_id')  
    }
  end

  describe 'Validations' do    
    it { should validate_presence_of(:quantity) }
    it { 
      should validate_numericality_of(:quantity)
      .is_greater_than_or_equal_to(0)
      .only_integer() 
    }
  end
  
  describe 'Uniqueness' do
    subject { create(:resource) }

    it { 
      should validate_uniqueness_of(:survivor_id)
      .scoped_to(:item_id)
      .with_message('Unique pair resource keys') 
    }
  end
end
