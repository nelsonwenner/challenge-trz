module TradesManager
  class ResourcesChecker < ApplicationService

    def initialize(survivor, resources, name)
      @survivor = survivor
      @resources = resources
      @name = name
    end
    
    def call
      resources_checker(@survivor, @resources, @name)
    end

    def resources_checker(survivor, resources, name)
      resources.each { |sent_resource|
        item_id = sent_resource[:item_id].to_i
        quantity = sent_resource[:quantity].to_i

        current_resource = survivor.resources.find { |i| i.item_id == item_id }

        raise Exception.new("#{name} resource item_id #{item_id} not found"
        ) if current_resource.nil?

        if current_resource.quantity < quantity
          raise Exception.new("#{name} does not have this resources quantity")
        end
      }
    end

    private

    attr_reader :survivor, :resources, :name
  end
end
