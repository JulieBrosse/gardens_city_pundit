class ChangeAvailabilitiesTypeInGardens < ActiveRecord::Migration[5.2]
  def change
    change_column :gardens, :availabilities, 'boolean USING CAST(availabilities AS boolean)', :default => false
  end
end
