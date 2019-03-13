class RemoveOwnerIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :owner_id, :integer
  end
end
