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
  belongs_to :order_item
  belongs_to :laundry_treatment

  validate :treatment_belongs_to_laundry

  before_validation :set_price, on: :create

  delegate :treatment, to: :laundry_treatment
  delegate :laundry, to: :laundry_treatment
  delegate :order, to: :order_item

  private

  def set_price
    return unless laundry_treatment.present?

    self.price = laundry_treatment.price
  end

  def treatment_belongs_to_laundry
    return unless laundry_treatment && order_item

    errors.add(:laundry_treatment, 'does not belong to laundry') if laundry != order.laundry
  end
end
