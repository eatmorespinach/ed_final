class ReviewsController < ApplicationController

	def show
		@review = Review.find(params[:id])
	end

	def create
		load_listing
		@review = @listing.reviews.build(params[:review])
		
		if @review.save
			redirect_to listing_path(params[:listing_id]), notice: 'Thanks for your review!'
		else
			render :action => :show
		end
	end

	def destroy
		@review = Review.find(params[:id])
		@review.destroy
	end

	private 

	def load_listing
		@listing = Listing.find(params[:listing_id])
	end


end