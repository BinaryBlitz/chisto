# == Schema Information
#
# Table name: payment_tokens
#
#  id                   :integer          not null, primary key
#  paid                 :boolean          default(FALSE)
#  payment_data         :jsonb            not null
#  response             :jsonb
#  order_id             :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  encoded_payment_data :text             not null
#

require 'test_helper'

class PaymentTokenTest < ActiveSupport::TestCase
  setup do
    @payment_token = payment_tokens(:payment_token)
  end

  test 'payment data is present' do
    @payment_token.payment_data = nil
    assert @payment_token.invalid?
  end

  test 'payment method is apple pay' do
    @payment_token.order.payment_method = :card
    assert @payment_token.invalid?
  end
end
