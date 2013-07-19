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

	describe "about, faq, and contact page" do
	
		before {visit about_path }

		it "should have title About page" do
			page.should have_content("About Page")
		end

		it "should have title faq" do
			page.should have_content ("faq")
		end

		it "should have title contact" do
			page.should have_content ("Contact")
		end


	
	end
end