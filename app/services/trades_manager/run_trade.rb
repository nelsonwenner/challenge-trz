module TradesManager
  class RunTrade < ApplicationService
    
    def initialize(sender, target, sender_resources, target_resources)
      @sender = sender
      @target = target
      @sender_resources = sender_resources
      @target_resources = target_resources
    end
    
    def call
      verify_survivors_infected(@sender, @target)
      resources_checker(@sender, @sender_resources, 'sender')
      resources_checker(@target, @target_resources, 'target')
      points_checker(@sender_resources, @target_resources)
    rescue Exception => err
      OpenStruct.new({success?: false, errors: err})
    else
      OpenStruct.new({success?: true})
    end

    def verify_survivors_infected(sender, target)
      if sender.infected or target.infected
        raise Exception.new 'infected survivors cannot trade'
      end
    end

    def resources_checker(survivor, resources, name)
      resources.each { |sent_resource|
        current_resource = survivor.resources.where(
          item_id: sent_resource[:item_id]
        ).first

        raise Exception.new(
          "#{name} resource item_id #{sent_resource[:item_id]} not found"
        ) if current_resource.nil?

        if current_resource.quantity < sent_resource[:quantity].to_i
          raise Exception.new("#{name} does not have this resources quantity")
        end
      }
    end
    
    def points_checker(sender_resources, target_resources)
      sender_points = calculate_points(sender_resources)
      target_points = calculate_points(target_resources)
      
      if sender_points != target_points
        raise Exception.new(
          "The scores of the target's resources are different from the sender"
        )
      end
    end

    def calculate_points(resources)
      resources.reduce(0) { |memo, hash|
        memo += Item.find(hash[:item_id]).value * hash[:quantity].to_i
      }
    end

    private

    attr_reader :sender, :sender_resources, :target, :target_resources
  end
end
