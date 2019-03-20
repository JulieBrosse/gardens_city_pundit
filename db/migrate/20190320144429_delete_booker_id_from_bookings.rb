class DeleteBookerIdFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :booker_id
  end
end
