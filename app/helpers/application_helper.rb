module ApplicationHelper

  def finished_step_zero?
    unless (User.find(session[:users_id])).email == "stephencharlesb@gmail.com"  
      unless (User.find(session[:users_id])).db_step_zero
        redirect_to new_db_step_zero_path
      end
    end
  end

  def bool_finished_step_zero?
    unless (User.find(session[:users_id])).email == "stephencharlesb@gmail.com"  
      unless (User.find(session[:users_id])).db_step_zero
        return false
      end
    end
    return true
  end

  def checkLiveDeals(db_publish_id, path)
    unless path == 'db_index'
    @db_publish = DbPublish.find(db_publish_id)
    @current_db = DealBuilder.find(@db_publish.deal_builder_id)
    @endDateTime = @db_publish.created_at
    @endDateTime += @db_publish.length_of_deal.days
      if (@db_publish.max_vouchers_to_sell > 0 &&
             @db_publish.max_vouchers_to_sell == @db_publish.total_vouchers_sold) then
        transferDealInfoToPrevPub(@db_publish)
        @db_publish.destroy
        if !current_user
          #redirect to deal expired or wrong link page, for now just home page
        elsif( path == 'db_show')
          redirect_to(@current_db)
        elsif( path == 'dbp_show')
          redirect_to(@current_db)
        end
      elsif @db_publish.length_of_deal > 0 && DateTime.now > @endDateTime
        transferDealInfoToPrevPub(@db_publish)
        @db_publish.destroy
        if !current_user
          #redirect to deal expired or wrong link page, for now just home page
        elsif( path == 'db_show')
          redirect_to(@current_db)
        elsif( path == 'dbp_show')
          redirect_to(@current_db)
        end
      end
    end
    @redirect = false
    if path == 'db_index'
      current_user.deal_builders.each do |deal_builder|
        if deal_builder.db_publish
					@endDateTime = deal_builder.db_publish.created_at
					@endDateTime += deal_builder.db_publish.length_of_deal.days
          if deal_builder.db_publish.max_vouchers_to_sell > 0 && 
              deal_builder.db_publish.max_vouchers_to_sell == deal_builder.db_publish.total_vouchers_sold then
             transferDealInfoToPrevPub(deal_builder.db_publish)
             deal_builder.db_publish.destroy
             @redirect = true
          elsif deal_builder.db_publish.length_of_deal > 0 && DateTime.now > @endDateTime
             transferDealInfoToPrevPub(deal_builder.db_publish)
             deal_builder.db_publish.destroy
             @redirect = true
          end
        end
       end
       if @redirect then 
        redirect_to deal_builders_path
        return
			 end
     end
    return false
  end

  def same_user?(id,location)
    if location == 'db'
			unless DealBuilder.find(id).user_id == session[:users_id] || bool_admin_authorize
			  return false
			end
	  end
	  if location == ('user_edit' || 'user_show')
	    unless id == session[:users_id]
	      return false
	    end
	  end
	  return true
  end

  def deal_live?(id)
     if DealBuilder.find(id).db_publish
       return true
     else 
       return false
     end 
  end

end
