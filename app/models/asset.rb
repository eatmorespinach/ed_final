class Asset < ActiveRecord::Base
	belongs_to :assetable, polymorphic: true
	validates :file, presence: true
	mount_uploader :file, AssetUploader
end
