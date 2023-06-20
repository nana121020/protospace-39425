class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :occupation, :position])
    # devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :name, :profile, :occupation, :position, :current_password])
  end
end

