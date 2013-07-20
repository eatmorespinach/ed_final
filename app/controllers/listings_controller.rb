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
  end

  def create
    @listing = Listing.new(set_listing)

    if @listing.save
      redirect_to listings_url, :alert => "Hosting created!"
    else
      render :new
    end
  end

  def update
    @listing = Listing.new(set_listing)

    if @listing.update_attributes(params[:listing])
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
  def set_listing
    params.require(:listing).permit(:title, :description, :guests, :city, :stay_length, :country_id, :image, :in_exchange)                                                       
  end

  #   # Never trust parameters from the scary internet, only allow the white list through.
  # def listing_params
  #   params[:listing]
  # end
end
