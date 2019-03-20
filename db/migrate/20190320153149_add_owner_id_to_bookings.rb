class AddOwnerIdToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :owner_id, :integer
  end
end
