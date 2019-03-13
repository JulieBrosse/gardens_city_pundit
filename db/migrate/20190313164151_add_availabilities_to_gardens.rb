class AddAvailabilitiesToGardens < ActiveRecord::Migration[5.2]
  def change
    add_column :gardens, :availabilities, :text
  end
end
