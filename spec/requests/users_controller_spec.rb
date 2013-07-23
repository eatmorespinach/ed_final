# require 'spec_helper'

# describe 'User sign up and login process' do 

# 	before {visit signup_path}



# 	describe "successfully create user" do
# 		fill_in "user[first_name]", with: 'Eric'
# 		fill_in "user[last_name]", with: 'Szeto'
# 		fill_in "user[email]", with: 'eric@gmail.com'
# 		fill_in "user[password]", with: '123456'
# 		fill_in "user[password_confirmation]", with: '123456'

# 		click_link 'Sign Up'

# 		it "should have increased the number of users" do
# 			User.all.count.should == 1
# 		end
# 	end	
# end