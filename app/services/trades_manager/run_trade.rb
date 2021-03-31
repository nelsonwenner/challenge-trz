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
    rescue Exception => err
      OpenStruct.new({success?: false, errors: err})
    else
      OpenStruct.new({success?: true})
    end

    def verify_survivors_infected(sender, target)
      if sender.infected or target.infected
        rescue raise Exception.new 'infected survivors cannot trade'
      end
    end

    private

    attr_reader :sender, :sender_resources, :target, :target_resources
  end
end
