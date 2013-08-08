# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Listing.destroy_all
Profile.destroy_all

@countries = ["United States", "Canada", "United Kingdom", "Germany", "Mexico"]
@guests = [0,1,2,3,4,5,6]
@first_name = ["Stephanie", "Alexandria", "Coretta", "Toni"]
@last_name = ["Sagat", "Kukoc", "Davidsonator", "Bradley-Longasshewit", "King"]

user = User.create(email: 'test@test.com', password: 'password', first_name: @first_name.sample, last_name: @last_name.sample)

30.times do
	a = User.create(email: Faker::Internet.email, 
		password: 'password', 
		first_name: Faker::Name.first_name, 
	 	last_name: Faker::Name.last_name)

 
	Listing.create(title: Faker::Company.bs, 
		description: Faker::Lorem.paragraph, 
		guests: @guests.sample,
		city: Faker::Address.city, 
		country: @countries.sample, 
		stay_length: Faker::Lorem.sentence, 
		in_exchange: Faker::Lorem.sentence, 
		user_id: a.id, 
		state: "active")
end


	Profile.create(helping_skills: Faker::Lorem.paragraph(sentence_count = 5), 
		teaching_skills: Faker::Lorem.paragraph(sentence_count = 5), 
		about: Faker::Lorem.paragraph(sentence_count = 5),
		hometown: Faker::Address.city, 
		nationality: @countries.sample, 
		current_city: Faker::Address.city, 
		user_id: 1,
		tagline: "Cowabunga")


#how do we set user_id to diff user every time?

#what do we do about Bob Sagat, who doesn't have a profile, so no current_city and nationality