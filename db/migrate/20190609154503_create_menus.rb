class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.date :date, null: false
      t.integer :delivery_place_id, null: false
      t.datetime :order_before_at, null: false

      t.timestamps
    end

   add_foreign_key :menus, :delivery_places
   add_index :menus, :delivery_place_id
   add_index :menus, [:delivery_place_id, :date], unique: true
  end
end
