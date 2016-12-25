class AddTreatmentToLineItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :line_items, :treatment, foreign_key: false
    add_column :line_items, :multiplier, :float, default: 1.0
  end
end
