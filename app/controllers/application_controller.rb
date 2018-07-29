class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user,
                :signed_in?

  private

  def authenticate_user!
    unless signed_in?
      cookies[:path] = request.fullpath
      redirect_to signin_path, alert: 'Are you a Guru? Verify your Email and Password please'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def signed_in?
    current_user.present?
  end

end
