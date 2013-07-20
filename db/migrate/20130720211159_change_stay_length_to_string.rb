class ChangeStayLengthToString < ActiveRecord::Migration
  def change
  	change_column :listings, :stay_length, :string
  end
end
