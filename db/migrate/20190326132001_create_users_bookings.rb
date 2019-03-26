class CreateUsersBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :assemblies_parts, id: false do |t|
      t.belongs_to :booking, index: true
      t.belongs_to :user, index: true
    end
  end
end
