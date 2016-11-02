class Partner::PartnerController < ApplicationController
  before_action :authenticate_partner!
  before_action :set_locale

  layout 'partner'

  private

  def set_locale
    I18n.locale = :ru
  end
end
