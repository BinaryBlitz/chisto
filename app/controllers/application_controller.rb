class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout :layout_by_resource

  protected

  def layout_by_resource
    return 'application' unless devise_controller?

    if resource_name == :laundry
      'partner'
    else
      'application'
    end
  end
end
