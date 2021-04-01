module Api
  module V1
    module Reports
      class SurvivorReportsController < ApplicationController
        def index
          survivors_infecteds = Survivor.as_infecteds(true).count.to_f
          survivors_not_infecteds = Survivor.as_infecteds(false).count.to_f
          survivors = Survivor.count

          render status: 200, json: {
            percentage_infecteds: (100 / survivors) * survivors_infecteds,
            percentage_not_infecteds: (100 / survivors) * survivors_not_infecteds
          }.to_json
        end
      end
    end      
  end
end
