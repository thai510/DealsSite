class FacebookShareCode < ActiveRecord::Base
  belongs_to :db_publish

  def FacebookShareCode.authenticate(typed_fb_code,db_publish_id)
    if fb_obj = find_by_code(typed_fb_code)
      if fb_obj.db_publish_id == db_publish_id.to_i 
        return db_publish_id 
      end
    end
    return nil
  end
end
