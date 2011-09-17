class PrivateDealSessionController < ApplicationController
  skip_before_filter :authorize
  def new
  end

  def create
   if publish_id = PrivateDealCode.authenticate(params[:typed_p_code])
      session[:pdc] = params[:typed_p_code]
      redirect_to DbPublish.find(publish_id)
   else
      redirect_to private_url, :notice => 'Invalid Offer Code'
   end

  end

  def destroy
      @current_code = PrivateDealCode.find_by_code(session[:pdc])
      @current_code.times_used += 1
      @current_code.save 
      session[:pdc] = nil 
      redirect_to private_url
  end
end
