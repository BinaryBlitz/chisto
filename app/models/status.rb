# == Schema Information
#
# Table name: statuses
#
#  id         :integer          not null, primary key
#  state      :integer          default("processing")
#  order_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Status < ApplicationRecord
  STATES = %i(processing confirmed cleaning dispatched completed canceled)
  MESSAGES = {
    'confirmed' => 'Дата и время сбора вещей согласованы. Ожидайте курьера.',
    'cleaning' => 'Ваши вещи уехали в чистку. Не беспокойтесь, скоро они вернутся!',
    'dispatched' => 'Чистые и свежие вещи уже едут к вам!',
    'completed' => 'Надеемся вы остались довольны! Пожалуйста оцените вашего исполнителя.'
  }

  belongs_to :order

  enum state: STATES

  after_create_commit :enqueue_notification

  delegate :user, to: :order

  def notify
    message = MESSAGES[state]
    Notifier.new(user, message, order_id: order_id)
  end

  private

  def enqueue_notification
    StatusNotificationJob.perform_later(self)
  end
end
