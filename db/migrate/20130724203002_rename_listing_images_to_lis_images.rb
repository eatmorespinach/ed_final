class RenameListingImagesToLisImages < ActiveRecord::Migration
  def change
  	rename_table :listing_images, :lis_images
  end
end
