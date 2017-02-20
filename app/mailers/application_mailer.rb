class ApplicationMailer < ActionMailer::Base
  default from: 'info@chis.to'
  layout 'mailer'

  I18n.locale = :ru
end
