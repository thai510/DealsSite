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
    @business = Business.find(session[:business_id]) 
    @liveOffers = @business.offers.where(:live => 1)
    @finishedOffers = @business.offers.where(:live => 2)
  end

  def destroy
    session[:business_id] = nil
    redirect_to b_login_path
  end

  def redeem
   @business = Business.find(session[:business_id])
  end

  def redeem_create
   @business = Business.find(session[:business_id])
   @voucher = @business.vouchers.find_by_code(params[:code])
   if @voucher && @voucher.redeemed == 0 
     @voucher.redeemed = 1
     @voucher.save
     redirect_to b_redeem_path,:notice => 'Code Successfully Redeemed!' 
   elsif !@voucher
     redirect_to b_redeem_path,:notice => 'Incorrect Code!' 
   else 
     redirect_to b_redeem_path,:notice => 'Code has already been Redeemed!' 
   end
  end

  def business_change_password_view
    @business = Business.find(session[:business_id])
  end

  def business_change_password_save
    @business = Business.find(session[:business_id])
    if @business.old_password_check(params[:old_password]) 
      respond_to do |format|
        unless params[:business][:password].blank?
          if @business.update_attributes(params[:business])
            format.html { redirect_to b_cp_path, notice: 'Password was successfully updated.' }
            format.json { head :ok }
          else
            format.html { redirect_to b_cp_path, notice: 'Password was not updated. Please provide correct current password. New password
            must be between 6 and 20 characters, and the confirmation must match your new password.' }
            format.json { render json: @business.errors, status: :unprocessable_entity }
          end
        else
          redirect_to b_cp_path, :notice => 'Password was not updated. Please provide correct current password. New password
              must be between 6 and 20 characters, and the confirmation must match your new password.'
        end
      end
    else
      redirect_to b_cp_path, :notice => 'Password was not updated. Please provide correct current password. New password
         must be between 6 and 20 characters, and the confirmation must match your new password.'
    end
  end
end
