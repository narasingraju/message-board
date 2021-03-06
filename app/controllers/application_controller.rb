class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_type, :avatar, :name]) 
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_type, :avatar, :name])
  end

  def after_sign_in_path_for(resource)
     posts_path
  end

  def after_sign_up_path_for(resource)
     posts_path
  end  
end
