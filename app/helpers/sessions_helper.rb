module SessionsHelper
  #Logs in user
  def log_in(user)
    session[:user_id] = user_id
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
