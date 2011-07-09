class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new
  end

  def create
    if user = User.authenticate(params[:email],params[:password])
      session[:users_id] = user.id
      redirect_to home_url
    else
      redirect_to login_url, :alert => "wrong"
    end
  end

  def destroy
    session[:users_id] = nil
    redirect_to home_url, :notice => "Logged out"
  end

end
