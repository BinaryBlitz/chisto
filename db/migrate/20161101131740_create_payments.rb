class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.belongs_to :order, foreign_key: true
      t.integer :amount, null: false
      t.boolean :paid, default: false
      t.string :payment_url

      t.timestamps
    end
  end
end
