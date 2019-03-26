class RenameBookerIdFromBookings < ActiveRecord::Migration[5.2]
  def change
    rename_column :bookings, :booker_number, :booker_number
  end
end
