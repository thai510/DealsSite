class PrivateDealCode < ActiveRecord::Base
  belongs_to :db_publish
  attr_reader :typed_p_code

  def PrivateDealCode.authenticate(typed_p_code)
    if code = find_by_code(typed_p_code)
      return code.db_publish_id
    end
    return nil
  end

end
