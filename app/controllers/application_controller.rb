class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    user_infos = %i(codewars_api_token codewars_nickname)
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :codewars_api_token, :codewars_nickname, :codewars_email, :codewars_password)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :codewars_api_token, :codewars_nickname, :codewars_email, :codewars_password)}
  end
end


