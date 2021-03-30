require 'rails_helper'

RSpec.describe Survivor, type: :model do
  describe 'Associantions' do 
    it { 
      should have_one(:location)
      .class_name('Location')
    }
    it { 
      should have_many(:flagger)
      .class_name('Flag')
      .with_foreign_key('flagger_id')
    }
    it { 
      should have_many(:flagged)
      .class_name('Flag')
      .with_foreign_key('flagged_id')
    }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name).on(:create) }
    it { should validate_presence_of(:age).on(:create) }
    it { 
      should validate_numericality_of(:age)
      .is_greater_than_or_equal_to(0)
      .only_integer() 
    }
    it { should validate_presence_of(:gender).on(:create) }
    it { 
      should define_enum_for(:gender).with_values([:male, :female]) 
    }
  end
end
