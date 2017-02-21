class AddPhoneNumberToLaundries < ActiveRecord::Migration[5.0]
  def change
    add_column :laundries, :phone_number, :string
  end
end
