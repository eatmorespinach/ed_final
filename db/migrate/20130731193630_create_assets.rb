class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :file
      t.belongs_to :assetable, polymorphic: true

      t.timestamps
    end
    add_index :assets, [:assetable_id, :assetable_type]
  end
end
