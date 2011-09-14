class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :back_to_home
  helper_method :industries_for_new_user
  helper_method :update_or_new_industry
  helper_method :bool_admin_authorize
  helper_method :bool_finished_step_zero?
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
  
  def industries_for_new_user
    temp_user =  Industry.all.map{ |x| x.title }
  end

  protected 

  def authorize
    unless User.find_by_id(session[:users_id])
      redirect_to login_index_url, :notice => "Please log in"
    end
  end

  def admin_authorize
    if(session[:users_id])
      if (User.find(session[:users_id])).email == "stephencharlesb@gmail.com" 
        return true
      end
       redirect_to home_path
    else 
       redirect_to login_index_url, :notice => "Please log in"
    end
  end
 
  def bool_admin_authorize
    if(session[:users_id])
      if (User.find(session[:users_id])).email == "stephencharlesb@gmail.com" 
        return true
      end
    end
    return false
  end

  def bool_finished_step_zero?
    unless bool_admin_authorize
      unless (User.find(session[:users_id])).db_step_zero
        return false
      end
    end
    return true
  end

  def finished_step_zero?
    unless bool_admin_authorize
      unless (User.find(session[:users_id])).db_step_zero
        redirect_to new_db_step_zero_path
      end
    end
  end



end
