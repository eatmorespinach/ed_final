require 'spec_helper'

describe 'User profile' do 
	before(:each) do
		visit root_path
	end

	it "non logged in user shoould not see profile button" do
		page.should_not have_content("Profile")
	end

	it "logged in user should see profile button on root" do
		user = FactoryGirl.create(:user)
		visit new_session_path
		fill_in('Email', :with => user.email)
		fill_in('Password', :with => 'password')
		click_button 'Log In'
		page.should have_content("Profile")
	end
	

	# it "for logged in user profile page should have dit profile button" do
	# 	clink_link 'Profile'
	# 	expect(page).to have_link("Edit Profile")
	# end

	



end