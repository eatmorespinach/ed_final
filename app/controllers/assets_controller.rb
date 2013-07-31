class AssetsController < ApplicationController
	before_filter :load_assetable
	def index
		@assets = @assetable.assets
	end

	def new
		@asset = Asset.new
	end

	def create
		@asset = @assetable.assets.build(params_asset)

		if @asset.save
	      redirect_to [@assetable, :assets], :alert => "Image Added"
	    else
	      render 'new', alert: 'Error image not uploaded'
	    end
	end

	def destroy
		@asset = Asset.find(params[:id])
		@asset.destroy
		redirect_to [@assetable, :assets], alert: "Image deleted"
	end

	private

	def params_asset
    	params.require(:asset).permit(:file, :remote_file_url)
	end

	def load_assetable
		resource, id = request.path.split('/')[1,2]
		@assetable = resource.singularize.classify.constantize.find(id)
	end

end
