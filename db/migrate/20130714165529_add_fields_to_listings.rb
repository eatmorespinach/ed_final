class AddFieldsToListings < ActiveRecord::Migration
  def change
    add_column :listings, :title, :string
    add_column :listings, :description, :text
    add_column :listings, :guests, :integer
  end
end
