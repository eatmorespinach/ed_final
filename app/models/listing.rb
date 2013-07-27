class Listing < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  belongs_to :user
  has_many :lis_images, dependent: :destroy

  validates :title, presence: true, length: {maximum: 40}
  validates :description, :city, :stay_length, :user_id, presence: true
  validates :guests, presence: true, numericality: true 
end
