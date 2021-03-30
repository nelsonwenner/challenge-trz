require 'rails_helper'

RSpec.describe Api::V1::SurvivorsController, type: :controller do
  describe 'POST #create' do
    let(:valid_survivor) { attributes_for(:survivor) }

    describe 'When attributes are valid' do
      it 'Should be able to create a new survivor' do
        expect{ 
          post :create, params: { survivor: valid_survivor }
        }.to change(Survivor, :count).by(1)
      end

      it 'Should be able to create a new resources' do
        expect{ 
          post :create, params: { survivor: valid_survivor }
        }.to change(Resource, :count).by(1)
      end

      it 'Should be able to create a new location' do
        expect{ 
          post :create, params: { survivor: valid_survivor }
        }.to change(Location, :count).by(1)
      end
    end
  end
end
