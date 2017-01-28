class AddIndexToPromoCodes < ActiveRecord::Migration[5.0]
  def change
    add_index :promo_codes, :code, unique: true
  end
end
