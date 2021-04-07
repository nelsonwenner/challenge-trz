module TradesManager
  class PointsChecker < ApplicationService

    def initialize(sender_resources, target_resources)
      @sender_resources = sender_resources
      @target_resources = target_resources
    end
    
    def call
      sender_points = calculate_points(@sender_resources)
      target_points = calculate_points(@target_resources)
      
      if sender_points != target_points
        raise Exception.new(
          "The scores of the target's resources are different from the sender"
        )
      end
    end

    def calculate_points(resources)
      resources.reduce(0) { |memo, hash|
        memo += Item.find(hash[:item_id].to_i).value * hash[:quantity].to_i
      }
    end

    private

    attr_reader :sender_resources, :target_resources
  end
end
