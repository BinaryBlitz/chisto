# == Schema Information
#
# Table name: order_items
#
#  id              :integer          not null, primary key
#  order_id        :integer
#  item_id         :integer
#  laundry_item_id :integer
#  quantity        :integer          default(1)
#  area            :decimal(10, 1)
#  has_decoration  :boolean          default(FALSE)
#  multiplier      :float            default(1.0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  belongs_to :laundry_item, optional: true

  has_many :order_treatments, dependent: :destroy, inverse_of: :order_item
  has_many :treatments, through: :order_treatments

  validates :quantity, numericality: { greater_than: 0 }
  validates :area, numericality: { greater_than: 0 }, allow_nil: true
  validates :order_treatments, presence: true
  validate :item_uses_area

  before_validation :set_laundry_item, on: :create
  before_validation :set_multiplier, on: :create

  accepts_nested_attributes_for :order_treatments

  delegate :laundry, to: :order

  def total_price
    (order_treatments_price * multiplier).ceil
  end

  def decoration_price
    total_price - order_treatments_price
  end

  private

  def order_treatments_price
    @order_treatments_price ||= begin
      price = order_treatments.inject(0) { |sum, order_treatment| sum + order_treatment.price }
      price * quantity * (area || 1)
    end
  end

  def set_laundry_item
    return unless laundry.present? && item.present?

    self.laundry_item = laundry.laundry_items.find_by(item: item)
  end

  def set_multiplier
    return unless has_decoration? && order.present? && laundry_item.present?

    self.multiplier = laundry_item&.decoration_multiplier || 1.0
  end

  def item_uses_area
    return unless item.present?

    errors.add(:area, 'is not allowed') if area.present? && !item.use_area?
    errors.add(:area, 'must be present') if area.nil? && item.use_area?
  end
end
