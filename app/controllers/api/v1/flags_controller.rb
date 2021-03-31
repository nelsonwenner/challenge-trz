module Api
  module V1
    class FlagsController < ApplicationController
      def create
        @flag = Flag.new(flag_params)

        if @flag.flagger.infected
          return render status: 400, json: {
            error: 'An infected survivor cannot signal'
          }
        end

        if @flag.save
          render status: 201, json: @flag, serializer: FlagSerializer 
        else
          render status: 400, json: errors(@flag)
        end
      end      

      private

      def flag_params 
        params.require(:flag).permit(:flagger_id, :flagged_id)
      end

      def errors(record)
        { errors: record.errors.messages }
      end
    end
  end
end
