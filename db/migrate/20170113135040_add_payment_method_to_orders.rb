class AddPaymentMethodToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :payment_method, :integer, default: 0
  end
end
