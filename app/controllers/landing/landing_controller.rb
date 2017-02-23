class Landing::LandingController < ApplicationController
  before_action :set_locale

  layout 'landing'

  protected

  def set_locale
    I18n.locale = params[:locale] || :ru
  end

  def default_url_options
    if I18n.locale == I18n.default_locale
      {}
    else
      { locale: I18n.locale }
    end
  end
end
