class Profile < ActiveRecord::Base
	belongs_to :user
	has many :pro_images
end
