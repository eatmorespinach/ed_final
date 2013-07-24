class Listing < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
  has_many :lis_images

  validates :title, presence: true, length: {maximum: 40}
  validates :guests, numericality: true 
end
