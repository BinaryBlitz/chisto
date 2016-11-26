# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  first_name       :string           not null
#  last_name        :string           not null
#  phone_number     :string           not null
#  email            :string
#  birthdate        :date
#  api_token        :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  city_id          :integer
#  street_name      :string
#  house_number     :string
#  apartment_number :string
#  notes            :text
#  contact_number   :string
#  orders_count     :integer          default(0)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:foo)
  end

  test 'valid' do
    assert @user.valid?
  end

  test 'invalid without first name' do
    @user.first_name = nil
    assert @user.invalid?
  end

  test 'invalid without last name' do
    @user.last_name = nil
    assert @user.invalid?
  end

  test 'phone number format' do
    @user.phone_number = '1'
    assert @user.invalid?

    @user.phone_number = '+79998887766'
    assert @user.valid?
  end

  test 'phone number is normalized' do
    phone_number = '79998887766'
    @user.phone_number = phone_number

    assert @user.valid?
    assert_equal Phonelib.parse(phone_number).e164, @user.phone_number
  end
end
