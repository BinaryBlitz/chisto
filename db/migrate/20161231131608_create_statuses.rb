class CreateStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :statuses do |t|
      t.integer :state, default: 0
      t.belongs_to :order, foreign_key: true

      t.timestamps
    end
  end
end
