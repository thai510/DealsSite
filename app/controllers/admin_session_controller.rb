class AdminSessionController < ApplicationController

  def create
   if admin = Admin.authenticate(params[:username],params[:password])
     session[:admin] = admin.username 
   end
     redirect_to admins_path 
  end

  def destroy
    session[:admin] = nil
    redirect_to admins_path
  end

end
