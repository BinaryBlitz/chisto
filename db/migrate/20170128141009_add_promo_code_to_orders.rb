class AddPromoCodeToOrders < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :promo_code, foreign_key: true
  end
end
