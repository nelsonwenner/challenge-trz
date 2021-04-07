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

      TradesManager::ResourcesChecker.call(@sender, @sender_resources, 'sender')
      TradesManager::ResourcesChecker.call(@target, @target_resources, 'target')
      TradesManager::PointsChecker.call(@sender_resources, @target_resources)

      ActiveRecord::Base.transaction do
        swap_resources(@sender, @sender_resources, @target)
        swap_resources(@target, @target_resources, @sender)
        @sender.save
        @target.save
      end

      result = {
        sender: SurvivorSerializer.new(@sender), 
        target: SurvivorSerializer.new(@target)
      }
      
    rescue Exception => err
      OpenStruct.new({success?: false, errors: err})
    else
      OpenStruct.new({success?: true, payload: result})
    end

    def swap_resources(sender, sender_resources, target)
      sender_resources.each { |hash_resource|
        item_id = hash_resource[:item_id].to_i
        quantity = hash_resource[:quantity].to_i

        sender_resource = sender.resources.find { |i| i.item_id == item_id }
        sender_resource.quantity -= quantity

        target_resource = target.resources.find { |i| i.item_id == item_id }

        if target_resource.nil?
          target.resources.create(item_id: item_id, quantity: quantity)
        else
          target_resource.quantity += quantity
        end
      }
    end

    def verify_survivors_infected(sender, target)
      if sender.infected or target.infected
        raise Exception.new 'infected survivors cannot trade'
      end
    end

    private

    attr_reader :sender, :sender_resources, :target, :target_resources
  end
end
