require 'spec_helper'

describe User do
	before do
		@user = User.new(first_name: "Eric",
						 last_name: "Szeto",
						 email: "eric@gmail.com",
						 password: "password",
						 password_confirmation: "password")
	end

	subject { @user }

	it { should be_valid }
	it { should respond_to(:first_name) }
	it { should respond_to(:last_name) }
	it { should respond_to(:email) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:listings) }
	it { should respond_to(:profile) }
	it { should respond_to(:reviews) }

	describe "when first name is blank" do
		before { @user.first_name = "" }
		it { should_not be_valid }
	end

	describe "when last name is blank" do
		before { @user.last_name = "" }
		it { should_not be_valid }
	end

	describe "when email is blank" do
		before { @user.email = "" }
		it { should_not be_valid }
	end

	describe "when email is invalid format" do
		before { @user.email = "gmail.com@worry" }
		it { should_not be_valid }
	end

	describe "when password is blank" do
		before { @user.password = "" }
		it { should_not be_valid }
	end

	describe "when password confirmation is blank" do
		before { @user.password_confirmation = "" }
		it { should_not be_valid }
	end

	describe "when password and password confirmation do not match" do
		before { @user.password = "wordpass" }
		it { should_not be_valid }
	end

	describe "when password is too short" do
		before { @user.password = @user.password_confirmation = "aaaaa" }
		it { should_not be_valid }	
	end
end