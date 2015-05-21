class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      flash[:notice] = "You logged in successfully. Have fun learning!"
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Either your username or password is incorrect"
      redirect_to login_path
    end
  end

  def destroy
    flash[:notice] = "You logged out successfully. Come back soon!"
    session[:user_id] = nil
    redirect_to root_path
  end

end
