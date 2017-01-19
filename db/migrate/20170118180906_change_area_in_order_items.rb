class ChangeAreaInOrderItems < ActiveRecord::Migration[5.0]
  def up
    change_column :order_items, :area, :decimal, precision: 10, scale: 1
  end

  def down
    change_column :order_items, :area, :integer
  end
end
