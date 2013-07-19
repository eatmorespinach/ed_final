require 'spec_helper'

describe "StaticPages" do

	describe "landing page" do

		before {visit root_path}

		it "should have title StayTraders" do
			page.should have_content("StayTraders")
		end



		describe "navbar" do

			it "should have non logged in nav bar" do
				page.should have_content("Sign Up")
				page.should have_content("Log In")
			end

		end
	end

	

end