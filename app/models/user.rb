class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :reviews, dependent: :destroy
  has_many :listings, dependent: :destroy
  has_one :profile, dependent: :destroy

  validates :first_name, presence: true, length: {maximum: 30}
  validates :last_name, presence: true, length: {maximum: 30}
  validates :password, length: {minimum: 6}, :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password
  validates_presence_of :password, :on => :create
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}

  before_save do |user|
      user.email = email.downcase
      user.first_name = first_name.capitalize
      user.last_name = last_name.capitalize
  end

  after_save :create_profile

  def create_profile
    Profile.create!(user_id: self.id, 
      helping_skills: "User still needs to fill in this field.", 
      teaching_skills: "User still needs to fill in this field.",
      about: "User still needs to fill in this field.",
      nationality: "United States") if profile.blank?
  end

  def avatar_path
    if self.profile.assets.empty?
      "avatar-70-by-70.gif"
    else
      self.profile.assets.first.file_url(:thumb)
    end
  end

end
