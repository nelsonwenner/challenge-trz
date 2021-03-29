require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'Associations' do
    it { 
      should belong_to(:survivor)
      .class_name('Survivor')
      .with_foreign_key('survivor_id')  
    }
  end
end
