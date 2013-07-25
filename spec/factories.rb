FactoryGirl.define do
  factory :user do
  	first_name "Ted"
  	last_name "Dancin"
  	sequence(:email) { |n| "Ted#{n}@example.com"}
  	password "password"
  end
  factory :listing do
  	title "Little House on the Prarie"
  	description "Description stuff. This is a really nice place to stay. It is amazing. "
  	guests 3
  	city "Toronto"
  	country_id 1
  	stay_length "Here for a while"
  	in_exchange "Want money"
  	user
  end
  factory :review do
  	rating 9
  	description "It was a pretty good place to stay"
  	user
  	listing
  end
end