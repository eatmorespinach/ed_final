class EditListingsTable < ActiveRecord::Migration
  def change
  	remove_column :listings, :country
  	add_column :listings, :country_id, :integer
  	add_column :listings, :stay_length, :integer
  	add_column :listings, :in_exchange, :text
  end
end
