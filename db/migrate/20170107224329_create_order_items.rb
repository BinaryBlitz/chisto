class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.references :item
      t.references :laundry_item
      t.integer :quantity, default: 1
      t.integer :area
      t.integer :total_price, null: false
      t.boolean :has_decoration, default: false
      t.float :multiplier, default: 1.0

      t.timestamps
    end
  end
end
