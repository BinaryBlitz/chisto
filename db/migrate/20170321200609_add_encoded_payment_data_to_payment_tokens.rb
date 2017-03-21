class AddEncodedPaymentDataToPaymentTokens < ActiveRecord::Migration[5.0]
  def change
    add_column :payment_tokens, :encoded_payment_data, :text, null: false
  end
end
