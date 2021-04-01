module Api
  module V1
    module Reports
      class ScoreLostSurvivorInfectedReportsController < ApplicationController
        before_action :set_survivor, only: [:show]

        def show
          total = @survivor.resources.reduce(0) { |memo, resource|
            memo += resource.quantity * resource.item.value
          }
          render status: 200, json: {
            survivor: @survivor, scores_lost: total
          }.to_json
        end
        
        private

        def set_survivor
          @survivor = Survivor.find(params[:id]) or not_found

          render status: 400, json: {
            errors:'survivor not infected'
          }.to_json if not @survivor.infected
        end
      end
    end      
  end
end
