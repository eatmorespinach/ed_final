class Listing < ActiveRecord::Base
	attr_accessible :description, :guests, :name
  has_many :reviews
  has_many :users, :through => :reviews
end
