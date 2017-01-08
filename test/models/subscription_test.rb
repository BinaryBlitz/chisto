# == Schema Information
#
# Table name: subscriptions
#
#  id           :integer          not null, primary key
#  phone_number :string
#  content      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase
  setup do
    @subscription = subscriptions(:subscription)
  end

  test 'valid' do
    assert @subscription.valid?
  end

  test 'phone number is present' do
    @subscription.phone_number = ''
    assert @subscription.invalid?
  end

  test 'content is present' do
    @subscription.content = ''
    assert @subscription.invalid?
  end
end
