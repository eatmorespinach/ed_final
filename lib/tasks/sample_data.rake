namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(first_name: "Drew",
      last_name: "Sing",
      email: "drew@gmail.com",
      password: "123456",
      password_confirmation: "123456")
    10.times do |n|
      User.create!(first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: "drew#{n+1}@gmail.com",
      password: "123456",
      password_confirmation: "123456")
    end
    10.times do |n|
      Listing.create!(title: Faker::Address.street_name,
        description: "Where everybody knows your name",
        guests: n+1,
        city: Faker::Address.city, 
        country_id: n+1, 
        stay_length: "#{n+1} days", 
        in_exchange: "I want stuff",
        user_id: 1)
    end
  end
end

