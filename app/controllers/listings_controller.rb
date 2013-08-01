class ListingsController < ApplicationController
  include ListingsHelper
  before_filter :require_login, except: [:index]
  before_filter :correct_user, only: [:edit, :update, :destroy]


  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
    @review = @listing.reviews.build
  end

  def new
    @listing = Listing.new
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def create
    @listing = current_user.listings.build(listing_params)
        
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

  def your_listing
    @listings = Listing.all
  end

  private

  #   # Use callbacks to share common setup or constraints between actions.
  def listing_params
    params.require(:listing).permit(:title, :description, :guests, :city, :stay_length, :country, :in_exchange)
  end

  def correct_user
    @listing = Listing.find(params[:id])
    redirect_to root_path unless current_user?(@listing.user)
  end

  # def listing_image_params
  #   params.require(:listing).permit(:file)
  # end

  #   # Never trust parameters from the scary internet, only allow the white list through.
  # def listing_params
  #   params[:listing]
  # end
end
