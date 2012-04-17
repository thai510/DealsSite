class AdminSessionController < ApplicationController

  def enter
  end

  def create
   if admin = Admin.authenticate(params[:username],params[:password])
     session[:admin] = admin.username 
     redirect_to admins_path
   else
     redirect_to enter_path 
   end
  end

  def destroy
    session[:admin] = nil
    redirect_to enter_path
  end

end
