class Review < ActiveRecord::Base
  # PPattr_accessible :description, :rating, :listing_id

  validates :rating, numericality: {only_integer: true}, inclusion: { in: 1..5 }

  belongs_to :listing
  belongs_to :user

end