class Listing < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
  has_many :listing_images
end
