class Profile < ActiveRecord::Base
	belongs_to :user
	has_many :pro_images, dependent: :destroy
end
