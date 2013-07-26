class ListingsController < ApplicationController
before_action :require_login, :only => [:show, :index]

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
    @listing = current_user.listings.build(listing_params)
    #if they save listing, but forget image, listing will not have image and will require user to update listing with image. 
    #user before_save possibly to solve.

    if @listing.save
      redirect_to @listing, notice: "Created Listing Successfully"
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
