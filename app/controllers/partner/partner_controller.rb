class Partner::PartnerController < ApplicationController
  before_action :authenticate_laundry!
  before_action :set_locale

  layout 'partner'

  private

  def set_locale
    I18n.locale = :ru
  end
end
