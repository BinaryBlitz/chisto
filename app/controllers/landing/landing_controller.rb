class Landing::LandingController < ApplicationController
  before_action :set_locale

  layout 'landing'

  private

  def set_locale
    I18n.locale = :ru
  end
end
