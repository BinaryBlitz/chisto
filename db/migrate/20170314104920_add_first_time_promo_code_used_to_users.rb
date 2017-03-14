class AddFirstTimePromoCodeUsedToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_time_promo_code_used, :boolean, default: false
  end
end
