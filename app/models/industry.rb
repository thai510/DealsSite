class Industry < ActiveRecord::Base
  has_many :subindustries, :dependent => :destroy

end
