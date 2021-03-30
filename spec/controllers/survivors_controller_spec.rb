require 'rails_helper'

RSpec.describe Api::V1::SurvivorsController, type: :controller do
  describe 'POST #create' do
    let(:valid_survivor) { attributes_for(:survivor) }
    let(:invalid_survivor) { attributes_for(:survivor, name: -1, age: -1) }
    let(:invalid_resources) {
      attributes_for(:survivor, 
        resources_attributes:[{item_id: -1, quantity: -1}])
    }
    let(:invalid_location) {
      attributes_for(:survivor, 
        location_attributes: {latitude: -100, longitude: 200})
    }

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

    describe 'When attributes are invalid' do
      it 'Should not be able to create a new survivor' do
        expect{ 
          post :create, params: { survivor: invalid_survivor }
        }.not_to change(Survivor, :count)
      end

      it 'Should not be able to create a new resources' do
        expect{ 
          post :create, params: { survivor: invalid_resources }
        }.not_to change(Resource, :count)
      end

      it 'Should not be able to create a new location' do
        expect{ 
          post :create, params: { survivor: invalid_location }
        }.not_to change(Location, :count)
      end
    end
  end
end
