module Api
  module V1
    class SurvivorsController < ApplicationController
      before_action :set_survivor, only: [:show]

      def create
        @survivor = Survivor.new(survivor_params)

        if @survivor.save
          render status: 201, json: @survivor, serializer: SurvivorSerializer 
        else
          render status: 400, json: errors(@survivor)
        end
      end

      def index
        render status: 200, json: survivors, each_serializer: SurvivorSerializer
      end

      def show
        render status: 200, json: @survivor, serializer: SurvivorSerializer 
      end

      private

      def survivors
        @survivor ||= Survivor.all
      end

      def set_survivor
        @survivor = Survivor.find(params[:id]) or not_found
      end

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