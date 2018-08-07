class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    attributes = [:first_name, :last_name, :email]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

  def after_sign_in_path_for(resource)

    if current_user.first_name
      flash.notice = "Hello, #{current_user.full_name}!"
    else
      flash.notice = 'Hello, friend!'
    end

    resource.admin? ? admin_tests_path : root_path

  end

end
