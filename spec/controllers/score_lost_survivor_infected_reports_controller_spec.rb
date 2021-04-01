require 'rails_helper'

RSpec.describe Api::V1::Reports::ScoreLostSurvivorInfectedReportsController, type: :controller do
  describe 'GET #show' do
    let(:infected_id) { 3 }

    it 'Should be able to return lost score from infected survivor' do
      get :show, params: { id: infected_id }
      expect(response.status).to equal(200)
      expect(eval(response.body)[:scores_lost]).to eq(100)
    end

    it 'Should not be able to return lost score, survivor not found' do
      get :show, params: { id: -1 }
      expect(response.status).to equal(404)
      expect(eval(response.body)).to eq({errors:'Survivor not found'})
    end

    it 'Should not be able to return lost score, survivor not infected' do
      get :show, params: { id: 1 }
      expect(response.status).to equal(400)
      expect(eval(response.body)).to eq({errors:'survivor not infected'})
    end
  end
end
