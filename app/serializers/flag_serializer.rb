class FlagSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :flagger
  belongs_to :flagged
end
