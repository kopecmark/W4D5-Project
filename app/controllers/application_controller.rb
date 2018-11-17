class ApplicationController < ActionController::Base

  helper_method :current_user, :signed_in?

  def login(user)
    # establish a relationship btw browser & server by setting the same session_token
    session[:session_token] = user.reset_session_token!
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def log_out
    # reset the user's session token
    # reset the browser's session hash
    # set current_user to nil

    self.reset_session_token!
    session[:session_token] = nil
    @current_user = nil
  end

  def signed_in?
    !!current_user
  end

  def require_sign_in
    redirect_to new_user_url unless signed_in?
    # change to new_session_url after we establish session
  end

end
