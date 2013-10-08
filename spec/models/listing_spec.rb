require 'spec_helper'

describe Listing do
	before do
		user = FactoryGirl.create(:user)
		@listing = Listing.new(title: "Home",
			description: "home is where the heart it",
			guests: 2,
			city: "Toronto",
			country: "Canada",
			stay_length: "Long time",
			in_exchange: "I want slaves",
			user_id: user.id)
	end

	subject { @listing }

	it { should be_valid }
	it { should respond_to(:title) }
	it { should respond_to(:guests) }
	it { should respond_to(:city) }
	it { should respond_to(:description) }
	it { should respond_to(:stay_length) }
	it { should respond_to(:in_exchange) }
	it { should respond_to(:user_id) }
	it { should respond_to(:user) }

	describe "when title is blank" do
		before { @listing.title = "" }
		it { should_not be_valid }
	end

	describe "when guests is blank" do
		before { @listing.guests = "" }
		it { should_not be_valid }
	end

	describe "when guests is not integer" do
		before { @listing.guests = "one" }
		it { should_not be_valid }
	end

	describe "when city is blank" do
		before { @listing.city = "" }
		it { should_not be_valid }
	end

	describe "when description is blank" do
		before { @listing.description = "" }
		it { should_not be_valid }
	end

	describe "when stay_length is blank" do
		before { @listing.stay_length = "" }
		it { should_not be_valid }
	end

	describe "when user_id is blank" do
		before { @listing.user_id = "" }
		it { should_not be_valid }
	end


end