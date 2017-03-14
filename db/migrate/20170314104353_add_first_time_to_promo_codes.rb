class AddFirstTimeToPromoCodes < ActiveRecord::Migration[5.0]
  def change
    add_column :promo_codes, :first_time_only, :boolean, default: false
  end
end
