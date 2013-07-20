require 'spec_helper'

describe 'User sign up and login process' do 
	before(:each) do
		visit root_path
		
	end

	it "successfully creates user" do
		click_link("Sign Up")
#it needed to be "it" instead of describe.
#We never actually loaded the Signup page!!! So it's in line 6

#are these tests view tests, model test...etc?
		fill_in "First name", with: 'Eric'
		fill_in "Last name", with: 'Szeto'
		fill_in "Email", with: 'eric@gmail.com'
		fill_in "Password", with: '123456'
		fill_in "Password confirmation", with: '123456'
		click_button 'Sign Up'
		page.should have_text("Hostings")
	end	

	it "successfully logs existing user in" do
		click_link("Log In")
		page.should have_text("Email")
		#how do we test existing user login
		#user = FactoryGirl.build(:user)?

	end



end