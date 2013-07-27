class ChangeCountryToString < ActiveRecord::Migration
  def change
  	change_column :listings, :country, :string
  end
end
