class AddGardenToBookings < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :garden, foreign_key: true
  end
end
