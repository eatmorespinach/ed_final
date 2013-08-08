module Assetable
	extend ActiveSupport::Concern

	included do
		has_many :assets, as: :assetable
	end

	def find_active
		self.assets.each do |asset|
			return asset if asset.active?
		end
	end
end