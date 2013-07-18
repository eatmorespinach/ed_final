class AddTownandCountryToListings < ActiveRecord::Migration
  def change
  	add_column :listings, :country, :string
  	add_column :listings, :city, :string
  end
end
