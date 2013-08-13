class Asset < ActiveRecord::Base
	belongs_to :assetable, polymorphic: true
	validates :file, presence: true
	mount_uploader :file, AssetUploader
	attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
	after_update :crop_image


	state_machine :state, initial: :inactive do
		event :activate do
			transition :inactive => :active
		end

		event :deactivate do
			transition :active => :inactive
		end

	end

	def preview_select(assetable)
		assetable.assets.each do |asset|
			asset.deactivate			
		end
		self.activate
	end

	def first_upload?(assetable)
		self.activate unless assetable.assets.count > 1
	end

	def crop_image
		file.recreate_versions! if crop_x.present?
	end


end
