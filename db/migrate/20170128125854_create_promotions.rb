class CreatePromotions < ActiveRecord::Migration[5.0]
  def change
    create_table :promotions do |t|
      t.string :name, null: false
      t.string :description
      t.references :laundry
      t.integer :promo_codes_count, null: false

      t.timestamps
    end
  end
end
