class PaytureClient
  PAYTURE_APPLE_PAY_URL = Rails.application.secrets.payture_host + '/ApplePay'
  PAYTURE_APPLE_PAY_METHOD = 'PAY'

  attr_reader :payment_data, :response

  def initialize(payment_data)
    @payment_data = payment_data
  end

  def pay
    response = HTTParty.post(PAYTURE_APPLE_PAY_URL, body: params).parsed_response
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
      PayToken: encoded_payment_data
    }
  end

  def encoded_payment_data
    Base64.encode64(@payment_data['data'])
  end
end
