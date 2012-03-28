class ApplicationController < ActionController::Base
  protect_from_forgery

  def isAdmin?
    if session[:admin] then return true end
    return false
  end

  def adminCheck
    unless isAdmin? then redirect_to admins_path end
  end

  def isBusiness?
    if session[:business_id] then return true end
    return false
  end

  def businessCheck
    unless isBusiness? then redirect_to b_login_path end
  end

end
