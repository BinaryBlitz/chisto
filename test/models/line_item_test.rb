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
#

require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  setup do
    @line_item = line_items(:line_item)
  end

  test 'valid' do
    assert @line_item.valid?
  end

  test 'quantity is positive' do
    @line_item.quantity = 0
    assert @line_item.invalid?
  end

  test 'price is positive' do
    @line_item.price = 0
    assert @line_item.invalid?
  end
end
