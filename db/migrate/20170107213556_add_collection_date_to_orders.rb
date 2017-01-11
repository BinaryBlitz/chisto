class AddCollectionDateToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :collection_date, :datetime
    add_column :orders, :delivery_date, :datetime
  end
end
