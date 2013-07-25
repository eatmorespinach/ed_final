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
		User.all.count.should == 1
	end

	it "signing up should generate a new profile automatically" do
		visit signup_path
		fill_in "First name", with: 'Eric'
		fill_in "Last name", with: 'Szeto'
		fill_in "Email", with: 'eric@gmail.com'
		fill_in "Password", with: '123456'
		fill_in "Password confirmation", with: '123456'
		click_button 'Sign Up'
		Profile.all.count.should == 1
	end
	
	

	# it "for logged in user profile page should have dit profile button" do
	# 	clink_link 'Profile'
	# 	expect(page).to have_link("Edit Profile")
	# end

	



end