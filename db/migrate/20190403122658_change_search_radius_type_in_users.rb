class ChangeSearchRadiusTypeInUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :search_radius
    add_column :users, :search_radius, :float
  end
end
