class AddingFieldsToProfiles < ActiveRecord::Migration
  def change
  	rename_column :profiles, :skills, :helping_skills
  	add_column :profiles, :teaching_skills, :text
  end
end
