class ResourceAverageReportsSerializer < ActiveModel::Serializer
  attributes :id, :name, :average

  def average
    @instance_options[:total] / @instance_options[:survivors_amount]
  end
end
