# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Listing.destroy_all

user = User.create(email: 'test@test.com', password: 'testee', first_name: 'Bob', last_name: 'Sagat')

 
10.times do
	Listing.create!(title: Faker::Lorem.word, description: Faker::Lorem.paragraph, 
		guests: 4, city: Faker::Address.city, country: "United", 
		stay_length: Faker::Lorem.sentence, in_exchange: Faker::Lorem.sentence, user_id: user.id)
end