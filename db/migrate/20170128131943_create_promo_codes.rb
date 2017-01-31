class CreatePromoCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :promo_codes do |t|
      t.string :code, null: false
      t.references :promotion
      t.references :laundry
      t.integer :discount, null: false
      t.boolean :reusable, default: false
      t.boolean :redeemed, default: false
      t.datetime :valid_from
      t.datetime :valid_until

      t.timestamps
    end
  end
end
