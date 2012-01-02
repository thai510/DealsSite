class ApplicationController < ActionController::Base
  before_filter :authorize
  helper_method :current_user
  helper_method :bool_admin_authorize
  protect_from_forgery
 
  private

  def current_sign_up
    sign_up = User.new
    #will have have add session data when we add privileges
    #and specific options for logged in users
    sign_up
  end

  protected 
  def current_user
    @current_user ||= User.find(session[:users_id]) if session[:users_id]
  end

  def authorize
    unless User.find_by_id(session[:users_id])
      redirect_to login_index_url
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

def admin_authorize
    if(session[:users_id])
      if (User.find(session[:users_id])).email == "stephencharlesb@gmail.com" 
        return true
      end
       redirect_to home_path
    else 
       redirect_to login_index_url
    end
  end

  def finished_step_zero?
    unless bool_admin_authorize
      unless (User.find(session[:users_id])).db_step_zero
        redirect_to new_db_step_zero_path
      end
    end
  end

  def transferDealInfoToPrevPub(db_publish)
    @db_publish = db_publish
    @restrictions = String.new
    @current_db = DealBuilder.find(@db_publish.deal_builder_id)
    @new_past_publish = PrevPublish.new do |pp|
      pp.total_vouchers_sold = @db_publish.total_vouchers_sold
      pp.max_vouchers_to_sell = @db_publish.max_vouchers_to_sell
      pp.start_of_deal = @db_publish.created_at
      pp.length_of_deal = @db_publish.length_of_deal
      pp.offer_title = @current_db.db_step_one.offer_title
      pp.offer_description = @current_db.db_step_one.offer_description
      pp.offer_value = @current_db.db_step_one.offer_value
      pp.offer_price = @current_db.db_step_one.offer_price
      pp.location_id = @current_db.db_step_two.locations[0].id
      #pp.coupon = @current_db.db_step_one.coupon
      pp.db_publish_id = @db_publish.id
      pp.private_deal = @db_publish.private_deal
      pp.fb_incentive == @current_db.db_step_four.fb_incentive;
      pp.fb_incentive_text = @current_db.db_step_four.fb_incentive_text
      pp.offer_photo_file_name = @current_db.db_step_one.offer_photo_file_name
      pp.offer_photo_content_type = @current_db.db_step_one.offer_photo_content_type
      pp.offer_photo_file_size = @current_db.db_step_one.offer_photo_file_size
      pp.offer_photo_updated_at = @current_db.db_step_one.offer_photo_updated_at
      @current_db.db_step_three.standard_restrictions.each do |s_r|
        @restrictions += s_r.description + ' '
      end
      @restrictions += @current_db.db_step_three.optional_restriction
      pp.restrictions = @restrictions
      pp.optional_incentive = @current_db.db_step_four.optional_incentive
      pp.voucher_length = @current_db.db_step_three.voucher_length

      pp.user_id = session[:users_id]
    end
    @new_past_publish.save
    @db_publish.vouchers.each do |voucher| #deal is over so give voucher access to past deal info
        voucher.prev_publish_id = @new_past_publish.id
        voucher.save
    end
  end

  def resetFBincentive
    session[:fb_allow] = nil
  end

end
