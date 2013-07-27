class RenameCountryIdToCountry < ActiveRecord::Migration
  def change
  	rename_column :listings, :country_id, :country
  end
end
