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
#  treatment_id         :integer
#

class OrderTreatment < ApplicationRecord
  belongs_to :order_item
  belongs_to :treatment
  belongs_to :laundry_treatment

  validate :treatment_belongs_to_laundry

  before_validation :set_treatment, on: :create
  before_validation :set_price, on: :create

  delegate :laundry, to: :laundry_treatment
  delegate :order, to: :order_item

  def treatment
    Treatment.unscoped { super }
  end

  private

  def set_treatment
    return unless laundry_treatment.present?

    self.treatment = laundry_treatment.treatment
  end

  def set_price
    return unless laundry_treatment.present?

    self.price = laundry_treatment.price
  end

  def treatment_belongs_to_laundry
    return unless laundry_treatment && order_item

    errors.add(:laundry_treatment, 'does not belong to laundry') if laundry != order.laundry
  end
end
