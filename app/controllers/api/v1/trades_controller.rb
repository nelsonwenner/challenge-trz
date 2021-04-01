module Api
  module V1
    class TradesController < ApplicationController
      before_action :set_sender_and_target, only: [:create]

      def create
        result = TradesManager::RunTrade.call(@sender, @target,
          trade_params[:sender_resources],
          trade_params[:target_resources]
        )

        if result && result.success?
          render status: 201, json: result.payload
        else
          render status: 400, json: errors(result)
        end
      end      

      private

      def set_sender_and_target
        @sender = Survivor.find(trade_params[:sender_id]) or not_found
        @target = Survivor.find(trade_params[:target_id]) or not_found
      end

      def trade_params 
        params.require(:trade).permit(
          :sender_id, :target_id,
          sender_resources: [:item_id, :quantity], 
          target_resources: [:item_id, :quantity]
        )
      end

      def errors(record)
        { errors: record.errors }
      end
    end
  end
end
