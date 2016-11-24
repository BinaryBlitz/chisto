class CreatePartnerApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :partner_applications do |t|
      t.string :representative_name, null: false
      t.string :laundry_name, null: false
      t.string :city
      t.string :phone_number
      t.string :email
      t.text :content

      t.timestamps
    end
  end
end
