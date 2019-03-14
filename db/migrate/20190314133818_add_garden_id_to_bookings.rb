class AddGardenIdToBookings < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :garden_id, foreign_key: true
  end
end
