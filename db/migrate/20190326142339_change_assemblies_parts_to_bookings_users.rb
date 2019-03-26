class ChangeAssembliesPartsToBookingsUsers < ActiveRecord::Migration[5.2]
  def change
    rename_table :assemblies_parts, :bookings_users
  end
end
