class ReviewsController < ApplicationController
	before_filter :load_review
	def show
		@review = Review.find(params[:id])
	end

	def create
		@listing = Listing.find(params[:listing_id])
		@review = Review.new(load_review)
		@review.listing_id = @listing.id

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

	def load_review
		params.require(:review).permit!
	end



end