class ReviewsController < ApplicationController
	before_filter :load_listing
	
	def show
		@review = Review.find(params[:id])
	end

	def create
		@review = current_user.reviews.build(review_params)
		@review.listing = @listing

		if @review.save
			redirect_to listing_path(params[:listing_id]), notice: 'Thanks for your review!'

		end
	end

	def destroy
		@review = Review.find(params[:id])
		@review.destroy
	end

	private 

	def review_params
		params.require(:review).permit(:rating, :description)
#what is :review? is it the review params, which includes rating, description, listing_id, user_id?
	end

	def load_listing
		@listing = Listing.find(params[:listing_id])
	end

end