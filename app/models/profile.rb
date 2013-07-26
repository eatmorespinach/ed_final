class Profile < ActiveRecord::Base
	belongs_to :user
	has_many :pro_images, dependent: :destroy
	validates :user_id, presence: true
	delegate :first_name, :last_name, :to => :user
end
