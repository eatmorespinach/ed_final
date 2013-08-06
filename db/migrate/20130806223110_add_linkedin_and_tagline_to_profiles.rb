class AddLinkedinAndTaglineToProfiles < ActiveRecord::Migration
  def change
  	add_column :profiles, :tagline, :string
  	add_column :profiles, :linkedin, :text
  end
end
