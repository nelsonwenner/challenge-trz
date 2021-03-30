require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'Validations' do    
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:value) }
    it { 
      should validate_numericality_of(:value)
      .is_greater_than_or_equal_to(0)
      .only_integer() 
    }
  end
end
