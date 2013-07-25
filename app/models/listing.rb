class Listing < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  belongs_to :user
  has_many :lis_images, dependent: :destroy

  validates :title, presence: true, length: {maximum: 40}
  validates :guests, numericality: true 
end
