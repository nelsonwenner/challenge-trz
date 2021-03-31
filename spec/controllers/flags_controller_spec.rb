require 'rails_helper'

RSpec.describe Api::V1::FlagsController, type: :controller do
  describe 'POST #create' do
    let(:sender1) { create(:survivor) }
    let(:sender2) { create(:survivor) }
    let(:sender3) { create(:survivor) }
    let(:sender4) { create(:survivor) }
    let(:sender5) { create(:survivor) }
    let(:target) { create(:survivor) }

    describe 'When attributes are valid' do
      it 'Should be able to create a new flag' do
        expect{ 
          post :create, params: { flag: 
            {
              flagger_id: sender1.id, 
              flagged_id: sender2.id
            } 
          }
        }.to change(Flag, :count).by(1)
      end

      it 'Should be able to infect a survivor with five flags'do
        Flag.create(flagger_id: sender1.id, flagged_id: target.id)
        Flag.create(flagger_id: sender2.id, flagged_id: target.id)
        Flag.create(flagger_id: sender3.id, flagged_id: target.id)
        Flag.create(flagger_id: sender4.id, flagged_id: target.id)

        expect{
          post :create, params: { flag: 
            {
              flagger_id: sender5.id, 
              flagged_id: target.id
            }
          }
          target.reload
        }.to change(target, :infected).to(true)
      end
    end
  end
end
