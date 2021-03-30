require 'rails_helper'

RSpec.describe Survivor, type: :model do
  describe 'Associantions' do 
    it { 
      should have_one(:location)
      .class_name('Location')
      .with_foreign_key('survivor_id') 
    }
    it { 
      should have_many(:resources)
      .class_name('Resource')
      .with_foreign_key('survivor_id') 
    }
  end
end
