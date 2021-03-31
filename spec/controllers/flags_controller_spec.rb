require 'rails_helper'

RSpec.describe Api::V1::FlagsController, type: :controller do
  describe 'POST #create' do
    let(:survivor_flagger1) { create(:survivor) }
    let(:survivor_flagger2) { create(:survivor) }
    let(:survivor_flagger3) { create(:survivor) }
    let(:survivor_flagger4) { create(:survivor) }
    let(:survivor_flagger5) { create(:survivor) }
    let(:survivor_target) { create(:survivor) }

    describe 'When attributes are valid' do
      it 'Should be able to create a new flag' do
        expect{ 
          post :create, params: { flag: 
            {
              flagger_id: survivor_flagger1.id, 
              flagged_id: survivor_flagger2.id
            } 
          }
        }.to change(Flag, :count).by(1)
      end
    end
  end
end
