# == Schema Information
#
# Table name: order_items
#
#  id              :integer          not null, primary key
#  order_id        :integer
#  item_id         :integer
#  laundry_item_id :integer
#  quantity        :integer          default(1)
#  area            :integer
#  total_price     :integer          not null
#  has_decoration  :boolean          default(FALSE)
#  multiplier      :float            default(1.0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class OrderItem < ApplicationRecord
  belongs_to :order, inverse_of: :order_items
  belongs_to :item
  belongs_to :laundry_item, optional: true

  validates :quantity, numericality: { greater_than: 0 }
  validates :total_price, numericality: { greater_than: 0 }
  validates :area, numericality: { greater_than: 0 }, allow_nil: true

  before_validation :set_laundry_item, on: :create
  before_validation :set_multiplier, on: :create
  before_validation :set_total_price, on: :create

  delegate :laundry, to: :order
  delegate :item, to: :laundry_item

  private

  def set_laundry_item
    return unless laundry.present? && item.present?

    self.laundry_item = laundry.laundry_items.find_by(item: item)
  end

  def set_multiplier
    return unless has_decoration? && order.present? && laundry_item.present?

    self.multiplier = laundry_item&.decoration_multiplier || 1.0
  end

  def set_total_price
    self.total_price = order_treatments_price * quantity * (area || 1)
  end

  def order_treatments_price
    1
  end
end
