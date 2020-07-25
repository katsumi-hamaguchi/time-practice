class ApplicationController < ActionController::Base
  protected

  def configure_permitted_parameters
    if resource_class == User
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    elsif resource_class == Admin
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    else
      super
    end
  end
end
