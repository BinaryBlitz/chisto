class ApplicationMailer < ActionMailer::Base
  default from: 'info@chis.to'
  layout 'mailer'

  before_action :set_locale

  private

  def set_locale
    I18n.locale = :ru
  end
end
