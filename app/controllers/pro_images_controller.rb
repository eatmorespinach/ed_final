class ProImagesController < ApplicationController
before_filter :load_profile

	def index
		@pro_images = ProImage.where(profile_id: params[:profile_id])
	end

	def new
		@pro_image = ProImage.new
	end

	def create
		@pro_image = @profile.pro_images.build(params_image)

		if @pro_image.save
			redirect_to profile_pro_images_path, :alert => "Image Added!"
		else
			render 'new', alert: 'Error image not uploaded'
		end
	end

	def show
		@pro_image = ProImage.find(params[:id])
	end

	def destroy
		@pro_image = ProImage.find(params[:id])
		@pro_image.destroy
		redirect_to profile_pro_images_path, alert: "Image deleted"
	end

	private

	def params_image
		params.require(:pro_image).permit(:file, :remote_file_url)
		
	end

	def load_profile
		@profile = Profile.where(user_id: current_user.id).first
	end

end
