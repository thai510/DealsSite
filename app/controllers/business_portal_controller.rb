class BusinessPortalController < ApplicationController
  before_filter :businessCheck, :except => [:login,:login_post]  

  def login
     end

  def login_post
   if business = Business.authenticate(params[:name],params[:password])
     session[:business_id] = business.id 
     redirect_to b_home_path 
   else
     redirect_to b_login_path
   end
  end

  def home
  end

  def destroy
    session[:business_id] = nil
    redirect_to b_login_path
  end

end
