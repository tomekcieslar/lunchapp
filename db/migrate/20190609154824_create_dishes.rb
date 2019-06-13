class CreateDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :dishes do |t|
      t.string :name, null: false
      t.decimal :price, null: false
      t.integer :menu_id, null: false

      t.timestamps
    end

    add_foreign_key :dishes, :menus
    add_index :dishes, :menu_id
  end
end
