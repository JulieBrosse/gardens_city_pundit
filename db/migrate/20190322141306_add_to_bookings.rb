class AddToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :owner_id, :integer
    add_column :bookings, :booker_id, :integer
  end
end
