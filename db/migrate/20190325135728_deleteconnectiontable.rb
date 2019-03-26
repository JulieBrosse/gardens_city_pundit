class Deleteconnectiontable < ActiveRecord::Migration[5.2]
  def change
    drop_table :bookings_users
  end
end
