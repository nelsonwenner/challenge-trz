module Api
  module V1
    module Reports
      class ResourcesAverageReportsController < ApplicationController
        def index
          survivors_amount = Survivor.as_infecteds(false).count.to_f
 
          resources_average = []
          Item.all.each do |item| 
            total = item.not_infected_resources.reduce(0) { |memo, resource|
              memo += resource.quantity
            }
            resources_average << {
              id: item.id, name: item.name,
              average: total / survivors_amount
            }
          end

          render status: 200, json: resources_average.to_json
        end
      end
    end      
  end
end
