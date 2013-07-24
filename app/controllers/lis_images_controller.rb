class LisImagesController < ApplicationController
before_filter :load_listing

	def index
		@lis_images = LisImage.where(listing_id: params[:listing_id])
	end

	def new
		@lis_image = LisImage.new
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
		@listing = current_user.listings.find(params[:listing_id])
	end


end