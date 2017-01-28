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
#  total_price      :integer          not null
#  delivery_fee     :integer          default(0)
#  collection_date  :datetime
#  delivery_date    :datetime
#  payment_method   :integer          default("card")
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  setup do
    @order = orders(:order)
    @promo_code = promo_codes(:promo_code)

    @new_order = @order.dup
    @new_order.order_items = [order_items(:order_item)]
  end

  test 'valid' do
    assert @order.valid?
  end

  test 'invalid without street_name' do
    @order.street_name = nil
    assert @order.invalid?
  end

  test 'invalid without house_number' do
    @order.house_number = nil
    assert @order.invalid?
  end

  test 'invalid without apartment_number' do
    @order.apartment_number = nil
    assert @order.invalid?
  end

  test 'invalid without contact_number' do
    @order.contact_number = nil
    assert @order.invalid?
  end

  test 'promo code is not already redeemed' do
    @new_order.promo_code = @promo_code
    @new_order.promo_code.redeem!

    assert @new_order.invalid?
  end

  test 'promo code has not expired' do
    @new_order.promo_code = @promo_code
    @new_order.promo_code.valid_until = 1.day.ago

    assert @new_order.invalid?
  end
end
