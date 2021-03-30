module Api
  module V1
    class SurvivorsController < ApplicationController
      def create
        @survivor = Survivor.new(survivor_params)

        if @survivor.save
          render status: 201, json: @survivor, serializer: SurvivorSerializer 
        else
          render status: 400, json: errors(@survivor)
        end
      end

      private

      def survivor_params
        params.require(:survivor).permit(:name, :age, :gender,
          location_attributes: [:latitude, :longitude], 
          resources_attributes: [:item_id, :quantity]
        )
      end

      def errors(record)
        { errors: record.errors.messages }
      end
    end
  end
end
