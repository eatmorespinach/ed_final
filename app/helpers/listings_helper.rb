module ListingsHelper

	DEFAULT_AVATAR = "/assets/default_avatar_image.gif"
	DEFAULT_LISTING = "/assets/default_listing_image.gif"

	def avatar_path(listing)
		image_src = listing.listing_profile.assets
		image_src.empty? ? DEFAULT_AVATAR : image_src.order("state ASC").first.file_url(:avatar)
	end

end
