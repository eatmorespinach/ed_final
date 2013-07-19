class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :reviews
  has_many :listings


  before_save {|user| user.email = email.downcase}
  validates_confirmation_of :password, length: {minimum: 6}
  validates_presence_of :password, :on => :create
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  
end
