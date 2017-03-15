class ApplicationController < ActionController::Base
  # Devise.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

  protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :admin])
  # end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up) do |user_params|
  #     user_params.permit(:admin, :username, :email, :password, :password_confirmation)
  #   end
  # end

  # Mivel új adattagokat adtunk a User-hez,
  # ezeket is hozzá kell adni az engedélyezett paraméterekhez.

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:username, :email, :admin)
    end
  end


end
