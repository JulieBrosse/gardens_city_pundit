class CreateGardens < ActiveRecord::Migration[5.2]
  def change
    create_table :gardens do |t|
      t.string :title
      t.text :details
      t.integer :surface
      t.text :address
      t.bigint :user_id
      t.timestamps
    end
  end
end
