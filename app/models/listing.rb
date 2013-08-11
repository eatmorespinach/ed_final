class Listing < ActiveRecord::Base
	include Assetable
  has_many :reviews, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, length: {maximum: 45}
  validates :description, :city, :stay_length, :user_id, presence: true
  validates :guests, presence: true, numericality: true 

	def to_param
		"#{id} #{title}".parameterize
	end

	def listing_profile
		self.user.profile
	end

	state_machine :state, initial: :pending do
		event :approve do
			transition :pending => :active
		end

		event :deactivate do
			transition :active => :inactive
		end

		event :reactivate do
			transition :inactive => :active
		end

	end

	scope :active, -> { where(state: 'active') }

	def self.data_for_map
		active.count(group: 'country').to_a.unshift(['Country', 'Listings'])
	end

end
