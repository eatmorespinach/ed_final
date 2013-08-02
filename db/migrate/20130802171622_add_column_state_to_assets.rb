class AddColumnStateToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :state, :string
  end
end
