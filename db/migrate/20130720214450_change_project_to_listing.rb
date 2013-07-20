class ChangeProjectToListing < ActiveRecord::Migration
  def change
  	rename_column :listing_images, :project_id, :listing_id
  end
end
