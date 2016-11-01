class PaymentsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_notification, only: [:create]
  before_action :set_payment, only: [:create]

  def create
    if @notification.success?
      @payment.paid!
      render plain: 'OK', status: :ok
    else
      head :unprocessable_entity
    end
  end

  private

  def set_notification
    @notification = Tinkoff::Notification.new(params)
  end

  def set_payment
    @payment = Payment.find_by!(order_id: @notification.order_id)
  end
end
