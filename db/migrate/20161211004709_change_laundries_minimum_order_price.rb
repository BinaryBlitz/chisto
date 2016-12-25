class ChangeLaundriesMinimumOrderPrice < ActiveRecord::Migration[5.0]
  def change
    change_column_default :laundries, :minimum_order_price, from: nil, to: 0
  end
end
