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
