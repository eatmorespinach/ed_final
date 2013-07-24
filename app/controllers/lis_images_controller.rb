class LisImagesController < ApplicationController
before_save :load_listing

	def new
		@lis_image = ListingImage.new
	end
	
	def create
		@lis_image = @listing.lis_images.build(params_image)

	    if @lis_image.save
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
    	params.require(:lis_image).permit(:file)
	end

	def load_listing
		@listing = current_user.listings.find(:listing_id)
	end


end