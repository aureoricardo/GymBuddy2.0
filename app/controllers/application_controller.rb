class ApplicationController < ActionController::Base


    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_out_path_for(resource_or_scope)
    welcome_path # <-- change this to your actual welcome page route
  end

  def after_sign_in_path_for(resource)
    home_path  # redirect to home page after login
  end


  protected 


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :username, :real_name, :cellphone, :avatar, :deadlift, :bench, :squat, :bio
    ])
    devise_parameter_sanitizer.permit(:account_update, keys: [
      :username, :real_name, :cellphone, :avatar, :deadlift, :bench, :squat, :bio
    ])
  end
end