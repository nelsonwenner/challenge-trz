require 'rails_helper'

RSpec.describe Api::V1::Reports::ScoreLostSurvivorInfectedReportsController, type: :controller do
  describe 'GET #show' do
    let(:infected_id) { 3 }

    it 'Should be able to return lost score from infected survivor' do
      get :show, params: { id: infected_id }
      expect(response.status).to equal(200)
      expect(eval(response.body)[:scores_lost]).to eq(100)
    end
  end
end
