require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'Associations' do
    it { 
      should belong_to(:survivor)
    }
  end

  describe 'Validations' do
    it {should validate_presence_of(:latitude)}
    it {should validate_presence_of(:longitude)}
    it { 
      should validate_numericality_of(:latitude)
      .is_greater_than_or_equal_to(-90)
      .is_less_than_or_equal_to(90)
    }
    it { 
      should validate_numericality_of(:longitude)
      .is_greater_than_or_equal_to(-180)
      .is_less_than_or_equal_to(180)
    }
  end
end
