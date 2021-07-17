module SessionsHelper
  def log_in(user)
    session[:username] = user.username
  end

  def current_user
    user_username = session[:username]
    user = User.find_by(username: user_username)
    @current_user = user if user
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    reset_session
    @current_user = nil
  end
end
