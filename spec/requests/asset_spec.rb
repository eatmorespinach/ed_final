require 'spec_helper'

describe "assets" do

	
	subject {page}

	let(:user) {FactoryGirl.create(:user)}
	let(:profile) {FactoryGirl.create(:profile, user: user)}
	before {sign_in user}

	describe "profile assets" do
		before do
			click_link "Profile"
			click_link "Manage Images"
		end

		it "should show no images to delete" do
			page.should_not have_content("Delete Image")
		end

		it "should allow correct user to upload image" do
			click_link "Add Image"
			fill_in "asset_remote_file_url", with: "https://lh6.googleusercontent.com/-aIo2RpDJRjg/AAAAAAAAAAI/AAAAAAAAAC8/1VoC52MxY1s/s46-c-k-no/photo.jpg"
			click_on "Upload Image"
			page.should have_content("Delete Image")
			Asset.all.count.should == 1
		end

	end

	
end