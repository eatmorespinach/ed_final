require 'spec_helper'

# describe "assets" do

# 	subject {page}

# 	let(:user) {FactoryGirl.create(:user)}
# 	let(:profile) {FactoryGirl.create(:profile, user: user)}
	
# 	before {sign_in user}

# 	describe "profile assets" do
# 		before do
# 			click_link "Profile"
# 			click_link "Manage Images"
# 		end

# 		it "should show no images to delete" do
# 			page.should_not have_css(".label-important")
# 		end

# 		it "should allow correct user to upload image" do
# 			click_link "Add Image"
# 			fill_in "asset_remote_file_url", with: "https://lh6.googleusercontent.com/-aIo2RpDJRjg/AAAAAAAAAAI/AAAAAAAAAC8/1VoC52MxY1s/s46-c-k-no/photo.jpg"
# 			click_on "Upload Image"
# 			page.should have_css(".label-important")
# 			Asset.all.count.should == 1
# 		end

		
# 		it "should allow correct user to delete image" do
# 			FactoryGirl.create(:asset, assetable_id: profile.id, assetable_type: profile.class.to_s)
# 			visit profile_assets_path(profile)
# 			page.should have_css(".label-important")
# 			click_link "X"
# 			page.should_not have_css(".label-important")
# 		end

# 	end

# 	let(:listing) {FactoryGirl.create(:listing, user: user)}

# 	describe "listing assets" do
# 		before do
# 			FactoryGirl.create(:listing, user: user)
# 			click_link "Hostings"
# 			click_link "Bitmaker"
# 			click_link "Manage Images"
# 		end

# 		it "should show no images to delete" do
# 			page.should_not have_css(".label-important")
# 		end

# 		it "should allow correct user to upload image" do
# 			click_link "Add Image"
# 			fill_in "asset_remote_file_url", with: "https://lh6.googleusercontent.com/-aIo2RpDJRjg/AAAAAAAAAAI/AAAAAAAAAC8/1VoC52MxY1s/s46-c-k-no/photo.jpg"
# 			click_on "Upload Image"
# 			page.should have_css(".label-important")
# 			Asset.all.count.should == 1
# 		end

# 		it "should allow correct user to delete image" do
# 			FactoryGirl.create(:asset, assetable_id: listing.id, assetable_type: listing.class.to_s)
# 			visit listing_assets_path(listing)
# 			page.should have_css(".label-important")
# 			click_link "X"
# 			page.should_not have_css(".label-important")
# 		end
# 	end

	
# end