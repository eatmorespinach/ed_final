class CreateProImagesTable < ActiveRecord::Migration
  def change
    create_table :pro_images do |t|
    	t.string :file
    	t.integer :profile_id
    end
  end
end
