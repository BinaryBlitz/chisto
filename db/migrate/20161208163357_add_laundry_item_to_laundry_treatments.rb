class AddLaundryItemToLaundryTreatments < ActiveRecord::Migration[5.0]
  def change
    add_reference :laundry_treatments, :laundry_item, foreign_key: true
  end
end
