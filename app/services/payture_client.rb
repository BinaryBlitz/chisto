class PaytureClient
  PAYTURE_APPLE_PAY_URL = Rails.application.secrets.payture_host + '/ApplePay'
  PAYTURE_APPLE_PAY_METHOD = 'PAY'

  attr_reader :encoded_payment_data, :response

  def initialize(encoded_payment_data, order_id:)
    @encoded_payment_data = encoded_payment_data
    @order_id = order_id
  end

  def pay
    response = HTTParty.post(PAYTURE_APPLE_PAY_URL, body: params)

    Rails.logger.info(response.request.options)
    Rails.logger.info(response.body)
    response = response.parsed_response
    # Payture sends Pay dictionary on success and PAY dictionary on failure
    @response = response['Pay'] || response['PAY']

    if @response['Success'] == 'True'
      true
    else
      Rails.logger.info "#{Time.zone.now}: Payture payment failed.\n#{@response}"
      false
    end
  end

  private

  def params
    {
      Key: Rails.application.secrets.payture_key,
      Method: PAYTURE_APPLE_PAY_METHOD,
      PayToken: encoded_payment_data,
      OrderId: @order_id
    }
  end
end
