# frozen_string_literal: true

class CreateDeliveryPlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_places do |t|
      t.string :name, null: false
      t.time :delivery_time, null: false
      t.time :delivery_order_time, null: false
      t.boolean :ahead_of_time, default: false
      t.timestamps
    end
  end
end
