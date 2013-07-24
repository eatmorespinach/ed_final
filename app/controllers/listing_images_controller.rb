class ListingImagesController < ApplicationController
before_save :load_listing

	def new
		@listing_image = ListingImage.new
	end
	
	def create
		@listing_image = @listing.listing_images.build(params_image)

	    if @listing_image.save
	      redirect_to listings_url(@listing), :alert => "Hosting created!"
	    else
	      render :new, notice: 'Error image not uploaded'
	    end
	end

	def edit
	end

	def update
	end

	private

	def params_image
    	params.require(:listing_image).permit(:file)
	end

	def load_listing
		@listing = current_user.listings.find(:listing_id)
	end


end