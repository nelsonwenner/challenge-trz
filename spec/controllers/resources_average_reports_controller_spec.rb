require 'rails_helper'

RSpec.describe Api::V1::Reports::ResourcesAverageReportsController, type: :controller do
  describe 'GET #index' do
    it 'Should be able to return resources average reports' do
      get :index
      expect(response.status).to equal(200)
      expect(eval(response.body)).to eq(
        [{"id":1,"name":"Fiji Water","average":5.0},
        {"id":2,"name":"Campbell Soup","average":0.0},
        {"id":3,"name":"First Aid Pouch","average":7.5},
        {"id":4,"name":"AK47","average":5.0}]
      )
    end
  end
end
