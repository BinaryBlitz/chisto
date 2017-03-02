class AddLongTreatmentToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :long_treatment, :boolean, default: false
  end
end
