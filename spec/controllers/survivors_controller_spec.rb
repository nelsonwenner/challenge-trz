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

  describe 'GET #show' do
    describe 'When attributes are valid' do
      let(:survivor) { create(:survivor) }

      it 'Should be able to get one survivor with valid id' do
        response = get :show, params: { id: survivor.id }
        expect(assigns(:survivor)).to be_a(Survivor)
        expect(response.status).to equal(200)
      end
    end

    describe 'When attributes are invalid' do
      it 'Should not be able to get one survivor with invalid id' do
        response = get :show, params: { id: -1 }
        expect(response.status).to equal(404)
      end
    end
  end

  describe 'GET #index' do
    it 'Should return a successful response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'PUT #update' do
    let(:survivor) { create(:survivor) }

    describe 'When attributes are valid' do
      it 'Should be able to update survivor location latitude' do
        response = put :update, params: { id: survivor.id,
          survivor: {latitude: 90, longitude: 180} } 
        expect(eval(response.body)[:location][:latitude]).to equal(90.0)
      end
    end
  end
end
