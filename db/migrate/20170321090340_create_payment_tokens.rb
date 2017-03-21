class CreatePaymentTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :payment_tokens do |t|
      t.boolean :paid, default: false
      t.jsonb :payment_data, null: false
      t.jsonb :response
      t.belongs_to :order, foreign_key: true

      t.timestamps
    end
  end
end
