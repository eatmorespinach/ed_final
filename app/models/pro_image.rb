class ProImage < ActiveRecord::Base
  belongs_to :profile
  mount_uploader :file, ProImageUploader
end
