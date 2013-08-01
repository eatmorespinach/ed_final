class DropLisImagesAndProImagesTables < ActiveRecord::Migration
  def change
  	drop_table :lis_images
  	drop_table :pro_images
  end
end
