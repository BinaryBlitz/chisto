# == Schema Information
#
# Table name: laundries
#
#  id                      :integer          not null, primary key
#  name                    :string           not null
#  description             :string           not null
#  logo                    :string
#  background_image        :string
#  category                :string           not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  city_id                 :integer
#  minimum_order_price     :integer
#  minimum_collection_time :integer
#  order_processing_time   :integer
#

require 'test_helper'

class LaundryTest < ActiveSupport::TestCase
  setup do
    @laundry = laundries(:laundry)
  end

  test 'valid' do
    assert @laundry.valid?
  end

  test 'category from list' do
    valid_categories = %w(economy premium)
    valid_categories.each do |category|
      @laundry.category = category
      assert @laundry.valid?
    end

    @laundry.category = 'a'
    assert @laundry.invalid?
  end

  test 'minimum order price is positive' do
    @laundry.minimum_order_price = 0
    assert @laundry.invalid?
  end

  test 'minimum collection time is positive' do
    @laundry.minimum_collection_time = 0
    assert @laundry.invalid?
  end

  test 'order processing time is positive' do
    @laundry.order_processing_time = 0
    assert @laundry.invalid?
  end

  # FIXME
  test 'invalid without image and logo' do
    skip
    @laundry.remove_image!
    @laundry.remove_logo!
    assert @laundry.invalid?
  end
end
