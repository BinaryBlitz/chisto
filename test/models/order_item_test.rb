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
#  has_decoration  :boolean          default(FALSE)
#  multiplier      :float            default(1.0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase
  setup do
   @order_item = order_items(:order_item)
 end

  test 'valid' do
    assert @order_item.valid?
  end

  test 'quantity is positive' do
    @order_item.quantity = 0
    assert @order_item.invalid?
  end

  test 'area is positive' do
    @order_item.area = 0
    assert @order_item.invalid?
  end
end
