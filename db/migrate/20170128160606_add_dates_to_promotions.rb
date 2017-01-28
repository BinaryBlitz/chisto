class AddDatesToPromotions < ActiveRecord::Migration[5.0]
  def change
    add_column :promotions, :valid_from, :datetime
    add_column :promotions, :valid_until, :datetime
  end
end
