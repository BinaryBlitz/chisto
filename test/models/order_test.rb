require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  setup do
    @order = orders(:order)
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
end
