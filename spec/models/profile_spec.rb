require 'spec_helper'

describe Profile do

	before do
		user = FactoryGirl.create(:user)
		@profile = Profile.new(
			skills: "I am a Blacksmith",
			about: "I am rock",
			hometown: "Village",
			nationality: "Viking",
			current_city: "Asgard",
			user_id: user.id)
	end

	subject { @profile }

	it { should be_valid }
	it { should respond_to(:skills) }
	it { should respond_to(:about) }
	it { should respond_to(:hometown) }
	it { should respond_to(:nationality) }
	it { should respond_to(:current_city) }
	it { should respond_to(:user) }
	it { should respond_to(:user_id) }

	describe "when user_id is blank" do
		before { @profile.user_id = "" }
		it { should_not be_valid }
	end
end
