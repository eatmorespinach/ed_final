class AssetsController < ApplicationController
	before_filter :load_assetable, :correct_user

	def index
		@assets = @assetable.assets
	end

	def new
		@asset = Asset.new
	end

	def create
		@asset = @assetable.assets.build(params_asset)

		if @asset.save
			@asset.first_upload?(@assetable)
	    	redirect_to [@assetable, :assets], :alert => "Image Added"
	    else
	      render 'new', alert: 'Error: Image not uploaded'
	    end
	end

	def show
		@asset = Asset.find(params[:id])
	end

	def edit
		@asset = Asset.find(params[:id])

	end

	def update 
		if params[:selected]
			@asset = Asset.find(params[:selected])
			@asset.preview_select(@assetable)
			redirect_to @assetable, alert: "Default Image Selected"
		else
			@asset = Asset.find(params[:id])
			@asset.update_attributes(params_asset)
			redirect_to [@assetable, :assets]
		end
	end


	def destroy
		@asset = Asset.find(params[:id])
		if @asset.active?
			@asset.destroy
			set_first_active(@assetable)
		else
			@asset.destroy
		end
		redirect_to [@assetable, :assets], alert: "Image deleted"
	end

	private

	def params_asset
		params.require(:asset).permit(:file, :remote_file_url, :scale, :crop_x, :crop_y, :crop_w, :crop_h)
	end

	def load_assetable
		resource, id = request.path.split('/')[1,2]
		@assetable = resource.singularize.classify.constantize.find(id)
	end

	def correct_user
    	redirect_to root_path unless current_user?(@assetable.user)
  	end

  	def set_first_active(assetable)
		assetable.assets.first.activate unless assetable.assets.empty?
	end

end
