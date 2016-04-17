class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  helper_method :current_user
  helper_method :current_bar

  def current_bar
    @current_bar ||= Bar.find_by(id: session[:bar_id])
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

end
