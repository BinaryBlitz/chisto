class CreateOrderTreatments < ActiveRecord::Migration[5.0]
  def change
    create_table :order_treatments do |t|
      t.references :order_item, foreign_key: true
      t.references :laundry_treatment

      t.timestamps
    end
  end
end
