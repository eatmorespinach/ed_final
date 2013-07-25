FactoryGirl.define do
  factory :user do
  	first_name "Ted"
  	last_name "Dancin"
  	email "Tedlikestodance@gmail.com"
  	password "password"
  end
  factory :listing do
  	title "Bitmaker"
  	description "Description stuff"
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