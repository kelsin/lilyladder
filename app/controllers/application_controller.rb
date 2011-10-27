class ApplicationController < ActionController::Base
  check_authorization

  before_filter :authenticate!

  helper_method :current_user
  protect_from_forgery

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate!
    redirect_to signin_path unless session[:user_id]
  end
end
