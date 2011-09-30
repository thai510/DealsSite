class PurchaseSessionController < ApplicationController
  skip_before_filter :authorize
  helper_method :get_new_voucher_code
  def new
    session[:ps] = 9000
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @purchase_session }
    end
  end

  def create
    
  end

  def destroy
    session[:ps] = nil
  end

  def get_new_voucher_code
    @vCode = ActiveSupport::SecureRandom.hex(5)
      until Voucher.find_by_code(@vCode).nil?
        @vCode = ActiveSupport::SecureRandom.hex(5)
      end
      return @vCode
  end

end
