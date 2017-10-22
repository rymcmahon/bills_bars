class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true

  before_action :set_barrooms

  def set_barrooms
    @barrooms = Barroom.all
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end
end
