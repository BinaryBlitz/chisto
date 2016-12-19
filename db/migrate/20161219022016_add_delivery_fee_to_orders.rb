class AddDeliveryFeeToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :delivery_fee, :integer, default: 0
  end
end
