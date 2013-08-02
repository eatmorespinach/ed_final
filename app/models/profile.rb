class Profile < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	delegate :first_name, :last_name, :to => :user
	has_many :assets, as: :assetable


	def find_active
		self.assets.each do |asset|
			return asset if asset.active?
		end
	end
end
