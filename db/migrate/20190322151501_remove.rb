class Remove < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :booker_id
    remove_column :bookings, :owner_id
  end
end
