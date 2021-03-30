require 'rails_helper'

RSpec.describe Api::V1::SurvivorsController, type: :controller do
  describe 'POST #create' do
    let(:valid_survivor) { attributes_for(:survivor) }

    describe 'When attributes are valid' do
      it 'Should be able to create a new survivor' do
        expect{ 
          response = post :create, params: { survivor: valid_survivor }
        }.to change(Survivor, :count).by(1)
      end
    end
  end
end
