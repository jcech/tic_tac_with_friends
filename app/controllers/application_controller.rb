class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    render "/layouts/index"
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :avatar, :password, :password_confirmation) }
  end

end
