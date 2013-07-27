class Review < ActiveRecord::Base
  # PPattr_accessible :description, :rating, :listing_id

  validates :rating, numericality: {only_integer: true}

  belongs_to :listing
  belongs_to :user

end