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
end
