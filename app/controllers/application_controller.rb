class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_devise_locale, if: :devise_controller?

  layout :layout_by_resource

  protected

  def layout_by_resource
    return 'application' unless devise_controller?

    case resource_name
    when :laundry then 'partner'
    when :admin then 'admin'
    else 'application'
    end
  end

  def set_devise_locale
    I18n.locale = :ru if resource_name == :laundry
  end

  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end
end
