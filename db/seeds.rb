# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.create(name: 'Fiji Water', value: 14)
Item.create(name: 'Campbell Soup', value: 12)
Item.create(name: 'First Aid Pouch', value: 10)
Item.create(name: 'AK47', value: 8)

survivor1 = Survivor.create(name: 'Nelson', age: 28, gender: 'male')
survivor2 = Survivor.create(name: 'Carlos', age: 30, gender: 'male')
survivor3 = Survivor.create(name: 'Elcy', age: 20, gender: 'female', infected: true)

survivor1.resources.create(item_id: 1, quantity: 10)
survivor1.resources.create(item_id: 4, quantity: 10)
survivor2.resources.create(item_id: 3, quantity: 15)
survivor3.resources.create(item_id: 3, quantity: 10)
