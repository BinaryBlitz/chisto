class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

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
end
