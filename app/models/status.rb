# == Schema Information
#
# Table name: statuses
#
#  id         :integer          not null, primary key
#  state      :integer          default(0)
#  order_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Status < ApplicationRecord
  STATES = %i(processing confirmed cleaning dispatched completed canceled)
  MESSAGES = {
    'confirmed' => 'Дата и время забора вещей согласованы. Ожидайте курьера.',
    'cleaning' => 'Ваши вещи уехали в чистку. Не беспокойтесь, скоро они вернутся!',
    'dispatched' => 'Чистые и свежие вещи уже едут к вам!',
    'completed' => 'Надеемся вы остались довольны! Пожалуйста оцените вашего исполнителя.'
  }

  belongs_to :order

  enum state: STATES

  after_create :notify

  delegate :user, to: :order

  private

  def notify
    message = MESSAGES[state]
    Notifier.new(user, message, order_id: order_id)
  end
end
