class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for(resource)

    if current_user.first_name && current_user.second_name
      flash.notice = "Hello, #{current_user.first_name.capitalize} #{current_user.second_name.capitalize}!"
    else
      flash.notice = 'Hello, friend!'
    end

    resource.is_a?(Admin) ? admin_tests_path : root_path

  end

end
