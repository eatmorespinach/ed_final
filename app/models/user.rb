class User < ActiveRecord::Base
  authenticates_with_sorcery!


  has_many :reviews, dependent: :destroy
  has_many :listings, dependent: :destroy
  has_one :profile, dependent: :destroy

  before_save {|user| user.email = email.downcase}
  validates :first_name, presence: true, length: {minimum: 2, maximum:30}
  validates :last_name, presence: true, length: {maximum: 30}
  validates_confirmation_of :password, length: {minimum: 6}
  validates_presence_of :password, :on => :create
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}

  after_save :create_profile

  def create_profile

    Profile.create!(user_id: self.id) if profile.blank?
  end

end
