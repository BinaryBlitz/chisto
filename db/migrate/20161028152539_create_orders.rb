class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :laundry, foreign_key: true
      t.integer :status, default: 0
      t.boolean :paid, default: false
      t.string :street_name
      t.string :house_number
      t.string :apartment_number
      t.string :contact_number
      t.text :notes

      t.timestamps
    end
  end
end
