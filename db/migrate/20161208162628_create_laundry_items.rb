class CreateLaundryItems < ActiveRecord::Migration[5.0]
  def change
    create_table :laundry_items do |t|
      t.belongs_to :laundry, foreign_key: true
      t.belongs_to :item, foreign_key: true
      t.float :decoration_multiplier, default: 1.0

      t.timestamps
    end
  end
end
