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
#  has_decoration       :boolean          default(FALSE)
#  treatment_id         :integer
#  multiplier           :float            default(1.0)
#

class LineItem < ApplicationRecord
  belongs_to :order, inverse_of: :line_items
  belongs_to :laundry_treatment
  belongs_to :treatment

  validates :quantity, numericality: { greater_than: 0 }
  validates :price, numericality: { greater_than: 0 }

  before_validation :set_treatment, on: :create
  before_validation :set_multiplier, on: :create
  before_validation :set_price, on: :create

  delegate :laundry, to: :order
  delegate :item, to: :treatment

  def total_price
    (price * quantity * multiplier).to_i
  end

  private

  # Use treatment when laundry_treatment record is deleted
  def set_treatment
    self.treatment = laundry_treatment.treatment
  end

  def set_price
    self.price = laundry_treatment.price
  end

  def set_multiplier
    if has_decoration?
      self.multiplier = laundry.laundry_items.find_by(item: item)&.decoration_multiplier || 1.0
    else
      self.multiplier = 1.0
    end
  end
end
