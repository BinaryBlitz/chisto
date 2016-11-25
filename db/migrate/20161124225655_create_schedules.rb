class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.belongs_to :laundry, foreign_key: true
      t.integer :day_of_the_week, null: false
      t.time :opens_at, null: false
      t.time :closes_at, null: false

      t.timestamps
    end
  end
end
