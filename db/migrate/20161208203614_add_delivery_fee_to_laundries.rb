class AddDeliveryFeeToLaundries < ActiveRecord::Migration[5.0]
  def change
    add_column :laundries, :free_delivery_from, :integer, default: 0
    add_column :laundries, :delivery_fee, :integer, default: 0
  end
end
