class ApplicationController < ActionController::Base
  before_filter :authorize
  helper_method :current_user
  helper_method :back_to_home
  helper_method :set_current_industry
  helper_method :get_current_industry
  protect_from_forgery
 
  @current_industry
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
  
  def set_current_industry(industry)
     @current_industry = Industry.find_by_id(industry)
  end

  def get_current_industry
     @current_industry
  end

def industry (somevar)

    render :partial => 'users/industry' 
    #{render :partial => 'users/industry'}
    #while params[:industry] != nil
    #  somevar << params[:industry]
     # render :partial => 'users/industry'
    #end
  end
 

  protected 

  def authorize
    unless User.find_by_id(session[:users_id])
      redirect_to login_index_url, :notice => "Please log in"
    end
  end

  def admin_authorize
    if current_user
      unless (User.find_by_id(session[:users_id])).email == "stephencharlesb@gmail.com" 
        redirect_to home_url
      end
    else
      redirect_to home_url
    end
  end



end
