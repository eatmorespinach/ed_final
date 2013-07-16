class Review < ActiveRecord::Base
  # PPattr_accessible :description, :rating, :listing_id

  belongs_to :listings
  belongs_to :users

end