require 'spec_helper'

describe 'User sign up and login process' do 
	before(:each) do
		visit root_path
		
	end

	it "successfully creates user" do
		click_link("Sign Up")
		fill_in "First name", with: 'Eric'
		fill_in "Last name", with: 'Szeto'
		fill_in "Email", with: 'eric@gmail.com'
		fill_in "Password", with: '123456'
		fill_in "Password confirmation", with: '123456'
		click_button 'Sign Up'
		page.should have_text("Welcome to StayTraders")
	end	

	it "successfully logs in existing user" do
		user = FactoryGirl.create(:user)
		click_link("Log In")
		page.should have_text("Email")
		fill_in('Email', :with => user.email)
		fill_in('Password', :with => 'password')
		click_button 'Log In'
		expect(page).to have_text("Hostings")
	end

	it "successfully logs out a user" do
		user = FactoryGirl.create(:user)
		click_link("Log In")
		page.should have_text("Email")
		fill_in('Email', :with => user.email)
		fill_in('Password', :with => 'password')
		click_button 'Log In'
		expect(page).to have_text("Hostings")
		click_link 'Log out'
		expect(page).to have_text("Logged out")
	end



end