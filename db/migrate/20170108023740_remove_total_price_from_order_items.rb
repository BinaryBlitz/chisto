class RemoveTotalPriceFromOrderItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :order_items, :total_price, :integer, null: false
  end
end
