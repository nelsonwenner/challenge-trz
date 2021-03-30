FactoryBot.define do
  factory :survivor do
    name { Faker::Name.name }
    age { Faker::Number.within(range: 1..50) }
    gender { ['male','female'].sample }
    location_attributes { {
      latitude: Faker::Number.within(range: -90..90).to_f,
      longitude: Faker::Number.within(range: -180..180).to_f
    } }
    resources_attributes { [
      {
        item_id: Faker::Number.within(range: 1..4), 
        quantity: Faker::Number.within(range: 2..15) 
      }
    ] }
  end
end
