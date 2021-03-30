class Survivor < ApplicationRecord
  scope :is_infected, -> { where(infected: true) }

  has_one :location, class_name: 'Location'
  has_many :resources, class_name: 'Resource'

  has_many :flagger, class_name: 'Flag', foreign_key: 'flagger_id'
  has_many :flagged, class_name: 'Flag', foreign_key: 'flagged_id'

  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :resources

  enum gender: [:male, :female]

  validates_presence_of :name, :age, :gender, on: :create
  validates_numericality_of :age, greater_than_or_equal_to: 0, only_integer: true
end
