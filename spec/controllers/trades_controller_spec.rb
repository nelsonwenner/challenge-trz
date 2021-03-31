require 'rails_helper'

RSpec.describe Api::V1::TradesController, type: :controller do
  describe 'POST #create' do
    let(:sender) { create(:survivor, resources_attributes:[
    {item_id: 1, quantity: 10}, {item_id: 2, quantity: 20}])}
    let(:target) { create(:survivor, resources_attributes:[
    {item_id: 2, quantity: 20}])}
    let(:infected_id) { 3 }

    describe 'When attributes are valid' do
      it 'Should not be able to trade with a infected' do
        response = post :create, params: { trade: {
            sender_id: infected_id, 
            sender_resources: [{item_id: 1, quantity: 10}],
            target_id: target.id, 
            target_resources: [{item_id: 2, quantity: 10}]
          }
        }
        expect(eval(response.body)).to eq(
          {'errors':'infected survivors cannot trade'}
        )
      end

      it 'Should not be able to sender trade resources that you do not have the quantity' do
        response = post :create, params: { trade: {
            sender_id: sender.id, 
            sender_resources: [{item_id: 1, quantity: 20}],
            target_id: target.id, 
            target_resources: [{item_id: 1, quantity: 10}]
          }
        }
        expect(eval(response.body)).to eq(
          {'errors':'sender does not have this resources quantity'}
        )
      end

      it 'Should not be able to sender target resources that you do not have the quantity' do
        response = post :create, params: { trade: {
            sender_id: sender.id, 
            sender_resources: [{item_id: 1, quantity: 10}],
            target_id: target.id, 
            target_resources: [{item_id: 2, quantity: 30}]
          }
        }
        expect(eval(response.body)).to eq(
          {'errors':'target does not have this resources quantity'}
        )
      end

      it 'Should not be able to find the resource with id invalid' do
        response = post :create, params: { trade: {
            sender_id: sender.id, 
            sender_resources: [{item_id: -1, quantity: 10}],
            target_id: target.id, 
            target_resources: [{item_id: 2, quantity: 30}]
          }
        }
        expect(eval(response.body)).to eq(
          {'errors':'sender resource item_id -1 not found'}
        )
      end

      it 'Should not be able to trade, resource scores are different' do
        response = post :create, params: { trade: {
            sender_id: sender.id, 
            sender_resources: [{item_id: 1, quantity: 10}],
            target_id: target.id, 
            target_resources: [{item_id: 2, quantity: 10}]
          }
        }
        expect(eval(response.body)).to eq(
          {'errors':"The scores of the target's resources are different from the sender"}
        )
      end
    end
  end
end
