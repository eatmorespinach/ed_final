class LisImage < ActiveRecord::Base
	belongs_to :listing
	mount_uploader :file, LisImageUploader
	validates :file, presence: true
end
