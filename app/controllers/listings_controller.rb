class ListingsController < ApplicationController
  before_filter :require_login, except: [:index]
  before_filter :correct_user, only: [:edit, :update, :destroy]
  before_filter :admin_check, only: [:admin_page, :approve, :deactivate, :reactivate]


  def index
    @countries = Listing.where(state: "active").pluck(:country).uniq << ["All Countries", ""]
    @search = Listing.where(state: "active").search(params[:q])
    @listings = @search.result
  end

  def map
    @geodata = Listing.count(group: 'country')
    @geodata = @geodata.collect { |country, num| [country, num] }
    @geodata = @geodata.insert(0, ['Country', 'Listings'])
    respond_to do |format|
      format.html
      format.json { render json: @geodata.as_json }
    end
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
      NotificationsMailer.listing_created(@listing).deliver
      redirect_to listing_path(@listing), alert: "Hosting created. You can add images and edit while it waits for approval for display."
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
    @listing.deactivate
    redirect_to mylistings_path
  end

  def my_listings
    @listings = current_user.listings
  end

  def admin_page
    @listings = Listing.all.order("created_at ASC")
  end

  def approve
    @listing = Listing.find(params[:id])
    @listing.approve
    NotificationsMailer.listing_approved(@listing).deliver
    redirect_to admin_path
  end

  def deactivate
    @listing = Listing.find(params[:id])
    @listing.deactivate
    redirect_to admin_path
  end

  def reactivate
    @listing = Listing.find(params[:id])
    @listing.reactivate
    redirect_to admin_path
  end


  private

  #   # Use callbacks to share common setup or constraints between actions.
  def listing_params
    params.require(:listing).permit(:title, :description, :guests, :city, :stay_length, :country, :in_exchange)
  end

  def correct_user
    @listing = Listing.find(params[:id])
    redirect_to root_path unless current_user?(@listing.user) || current_user.admin == true
  end

  def admin_check
    redirect_to root_path unless current_user.admin?
  end

  # def listing_image_params
  #   params.require(:listing).permit(:file)
  # end

  #   # Never trust parameters from the scary internet, only allow the white list through.
  # def listing_params
  #   params[:listing]
  # end
end
