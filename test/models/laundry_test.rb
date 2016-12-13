# == Schema Information
#
# Table name: laundries
#
#  id                      :integer          not null, primary key
#  name                    :string           not null
#  description             :string           not null
#  logo                    :string
#  background_image        :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  city_id                 :integer
#  minimum_collection_time :integer
#  order_processing_time   :integer
#  email                   :string           default(""), not null
#  encrypted_password      :string           default(""), not null
#  reset_password_token    :string
#  reset_password_sent_at  :datetime
#  remember_created_at     :datetime
#  sign_in_count           :integer          default(0), not null
#  current_sign_in_at      :datetime
#  last_sign_in_at         :datetime
#  current_sign_in_ip      :inet
#  last_sign_in_ip         :inet
#  confirmation_token      :string
#  confirmed_at            :datetime
#  confirmation_sent_at    :datetime
#  unconfirmed_email       :string
#  rating                  :float            default(0.0)
#  ratings_count           :integer          default(0)
#  enabled                 :boolean          default(FALSE)
#  minimum_order_price     :integer          default(0)
#  free_delivery_from      :integer          default(0)
#  delivery_fee            :integer          default(0)
#

require 'test_helper'

class LaundryTest < ActiveSupport::TestCase
  setup do
    @laundry = laundries(:laundry)
  end

  test 'valid' do
    assert @laundry.valid?
  end

  test 'minimum order price is zero or positive' do
    @laundry.minimum_order_price = -1
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

  test 'invalid without image and logo' do
    @laundry.remove_background_image!
    @laundry.remove_logo!
    assert @laundry.invalid?
  end
end
