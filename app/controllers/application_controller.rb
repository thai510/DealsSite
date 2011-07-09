class ApplicationController < ActionController::Base
  before_filter :authorize
  helper_method :current_user
  protect_from_forgery

  private

  def current_sign_up
    sign_up = User.new
    #will have have add session data when we add privileges
    #and specific options for logged in users
    sign_up
  end

  def current_user
    @current_user ||= User.find(session[:users_id]) if session[:users_id]
  end

  protected 
  
  def authorize
    unless User.find_by_id(session[:users_id])
      redirect_to home_url, :notice => "Please log in"
    end
  end


end
