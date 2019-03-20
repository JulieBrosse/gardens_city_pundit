class DeleteGardenIdFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :garden_id
  end
end
