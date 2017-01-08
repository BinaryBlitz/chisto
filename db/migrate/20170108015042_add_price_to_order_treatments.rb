class AddPriceToOrderTreatments < ActiveRecord::Migration[5.0]
  def change
    add_column :order_treatments, :price, :integer, null: false
  end
end
