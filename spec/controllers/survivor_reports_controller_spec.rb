require 'rails_helper'

RSpec.describe Api::V1::Reports::SurvivorReportsController, type: :controller do
  describe 'GET #index' do
    it 'Should be able to return percentage infected and not infected reports' do
      get :index
      expect(response.status).to equal(200)
      expect(eval(response.body)).to eq(
        {"percentage_infecteds":33.0,"percentage_not_infecteds":66.0}
      )
    end
  end
end
