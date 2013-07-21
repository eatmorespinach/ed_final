class ListingImage < ActiveRecord::Base
	belongs_to :listing
	mount_uploader :file, ListingImageUploader
end
