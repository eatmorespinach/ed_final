class CreateListingImages < ActiveRecord::Migration
  def change
    create_table :listing_images do |t|
    	t.string :file
    	t.references :project, index: true
    	
      t.timestamps
    end
  end
end
