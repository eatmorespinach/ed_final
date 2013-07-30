class ProImage < ActiveRecord::Base
  belongs_to :profile
  validates :file, presence: true
  mount_uploader :file, ProImageUploader
end
