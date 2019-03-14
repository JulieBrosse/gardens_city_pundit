class DropBookers < ActiveRecord::Migration[5.2]
  def change
    drop_table :bookers
  end
end
