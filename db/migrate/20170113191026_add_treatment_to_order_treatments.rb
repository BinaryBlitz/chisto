class AddTreatmentToOrderTreatments < ActiveRecord::Migration[5.0]
  def change
    add_reference :order_treatments, :treatment, foreign_key: true
  end
end
