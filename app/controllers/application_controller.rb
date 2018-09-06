class ApplicationController < ActionController::Base

  #protect CSRF attacks by raising exceptions
  protect_from_forgery with: :exception

   before_action :authenticate_user! 
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

	def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :name, :photo) }
  	devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
  	devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :name, :photo) }
	end
end