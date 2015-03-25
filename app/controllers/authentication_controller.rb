class AuthenticationController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You have successfully signed in!"
      redirect_to root_path
    else
      flash[:notice] = "User / Password combination invalid"
      render :new
    end
  end

  def new
  end

  def destroy
    session.clear
    flash[:notice] = "You have successfully signed out"
    redirect_to root_path
  end


end
