class Profile < ActiveRecord::Base
	include Assetable
	belongs_to :user
	validates :user_id, presence: true
	delegate :first_name, :last_name, :to => :user
	
	attr_accessor :avatar_path, :default_image

	def to_param
		"#{id} #{first_name} #{last_name}".parameterize
	end

	def self.data_for_map
		count(group: 'nationality').to_a.unshift(['Nationality', 'Users'])
	end

	def find_active
		self.assets.each do |asset|
			return asset if asset.active?
		end
	end

end
