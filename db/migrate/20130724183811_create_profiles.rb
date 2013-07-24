class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.text :skills
      t.text :about
      t.string :hometown
      t.string :nationality
      t.string :current_city
      t.integer :user_id

      t.timestamps
    end
  end
end
