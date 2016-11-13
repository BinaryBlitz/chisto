# == Schema Information
#
# Table name: line_items
#
#  id                   :integer          not null, primary key
#  order_id             :integer
#  laundry_treatment_id :integer
#  quantity             :integer          default(1)
#  price                :integer          not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class LineItem < ApplicationRecord
  belongs_to :order, inverse_of: :line_items
  belongs_to :laundry_treatment

  validates :quantity, numericality: { greater_than: 0 }
  validates :price, numericality: { greater_than: 0 }

  before_validation :set_price, on: :create

  def total_price
    price * quantity
  end

  private

  def set_price
    self.price = laundry_treatment&.price
  end
end
