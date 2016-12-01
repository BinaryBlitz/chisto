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
    if resource_name == :laundry
      I18n.locale = :ru
    end
  end
end
