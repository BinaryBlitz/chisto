class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :line_items do |t|
      t.belongs_to :order, foreign_key: true
      t.belongs_to :laundry_treatment
      t.integer :quantity, default: 1
      t.integer :price, null: false

      t.timestamps
    end
  end
end
