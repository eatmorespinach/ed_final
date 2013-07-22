class ListingImagesController < ApplicationController

	def new
		@listing_image = ListingImage.new
	end
	
	def create
		@listing_image = ListingImage.new

    @listing_image.file = params[:listing][:file]

    if @listing_image.save
      redirect_to listings_url, :alert => "Hosting created!"
    else
      render :new, notice: 'you need to upload an image'
    end
	end
end