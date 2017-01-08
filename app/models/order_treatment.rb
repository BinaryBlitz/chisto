# == Schema Information
#
# Table name: order_treatments
#
#  id                   :integer          not null, primary key
#  order_item_id        :integer
#  laundry_treatment_id :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  price                :integer          not null
#

class OrderTreatment < ApplicationRecord
  belongs_to :order_item, inverse_of: :order_treatments
  belongs_to :laundry_treatment

  before_validation :set_price, on: :create

  delegate :treatment, to: :laundry_treatment

  private

  def set_price
    self.price = laundry_treatment.price
  end
end
