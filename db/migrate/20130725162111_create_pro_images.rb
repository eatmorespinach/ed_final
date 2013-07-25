class CreateProImages < ActiveRecord::Migration
  def change
    create_table :pro_images do |t|

      t.timestamps
    end
  end
end
