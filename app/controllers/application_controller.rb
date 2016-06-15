class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :profile_picture, :email, :password, :password_confirmation, :avatar])

     devise_parameter_sanitizer.permit(:account_update, keys: [:username, :profile_picture, :email, :password, :password_confirmation, :avatar])
   end

   def after_sign_in_path_for(resource)
     users_show_path(current_user)
   end

  protect_from_forgery with: :exception
end
