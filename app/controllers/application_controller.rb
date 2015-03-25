class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    User.find_by(id: session[:user_id])
  end

  def authenticate_user
    if !current_user
      flash[:notice] = "You must register or log in before you can do that! Fool!"
      redirect_to root_path
    end
  end

  helper_method :current_user

end
