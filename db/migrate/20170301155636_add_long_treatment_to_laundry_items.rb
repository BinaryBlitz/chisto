class AddLongTreatmentToLaundryItems < ActiveRecord::Migration[5.0]
  def change
    add_column :laundry_items, :long_treatment, :boolean, default: false
  end
end
