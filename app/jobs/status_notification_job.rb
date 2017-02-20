class StatusNotificationJob < ApplicationJob
  queue_as :default

  def perform(status)
    status.notify
  end
end
