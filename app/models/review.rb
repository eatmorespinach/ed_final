class Review < ActiveRecord::Base
  # PPattr_accessible :description, :rating, :listing_id

  belongs_to :listing
  belongs_to :user

end