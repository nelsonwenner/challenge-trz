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
            resources_average << ResourceAverageReportsSerializer.new(item, {
                survivors_amount: survivors_amount, total: total
              }
            )
          end

          render status: 200, json: resources_average.to_json
        end
      end
    end      
  end
end
