class ListingsController < ApplicationController
before_action :require_login, :only => [:show]

  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])

    if current_user
      @review = @listing.reviews.build
    end
  end

  def new
    @listing = Listing.new
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def create
    @listing = Listing.new(listing_params)
    #if they save listing, but forget image, listing will not have image and will require user to update listing with image. 
    #user before_save possibly to solve.
    @listing_image = ListingImage.new

    @listing_image.file = params[:listing][:file]
      #now we assign 

    if @listing.save
      @listing_image.listing_id = @listing.id #build would remove this line, and replace "new"
      if @listing_image.save
        redirect_to listings_url, :alert => "Hosting created!"
      else
        render :new, notice: 'you need to upload an image'
      end
    else
      render :new
    end
  end

  def update
    @listing = Listing.find(params[:id])

    if @listing.update_attributes(listing_params)
      redirect_to listing_path(@listing)
    else
      render :edit
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
  end

  private

  #   # Use callbacks to share common setup or constraints between actions.
  def listing_params
    params.require(:listing).permit(:title, :description, :guests, :city, :stay_length, :country_id, :in_exchange)
  end

  # def listing_image_params
  #   params.require(:listing).permit(:file)
  # end

  #   # Never trust parameters from the scary internet, only allow the white list through.
  # def listing_params
  #   params[:listing]
  # end
end
