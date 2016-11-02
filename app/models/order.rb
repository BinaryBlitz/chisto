# == Schema Information
#
# Table name: orders
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  laundry_id       :integer
#  status           :integer          default("processing")
#  paid             :boolean          default(FALSE)
#  street_name      :string
#  house_number     :string
#  apartment_number :string
#  contact_number   :string
#  notes            :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  email            :string
#

class Order < ApplicationRecord
  belongs_to :user
  belongs_to :laundry

  has_one :payment, dependent: :destroy

  enum status: %i(processing completed canceled)

  validates :street_name, :house_number, :apartment_number, :contact_number, presence: true
  validates :email, email: true

  def payment
    super || create_payment(amount: total_price)
  end

  def paid!
    return if paid?

    ActiveRecord::Base.transaction do
      update_column(:paid, true)
    end
  end

  private

  def total_price
    1
  end
end
