class AddUserToReviews < ActiveRecord::Migration
  def change
  	change_table :reviews do |t|
      t.belongs_to :user
    end
  end
end
