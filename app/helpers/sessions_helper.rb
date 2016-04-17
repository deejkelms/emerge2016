module SessionsHelper
  #Logs in user
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_in(bar)
    session[:bar_id] = bar.id
  end
  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_bar
    @current_bar ||= Bar.find_by(id: session[:bar_id])
  end
  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil? || !current_bar.nil?
  end
end
