class CreateProImages < ActiveRecord::Migration
  def change
    create_table :pro_images do |t|
      t.string :file
      t.references :profile, index: true

      t.timestamps
    end
  end
end
