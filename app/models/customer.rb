class Customer < ActiveRecord::Base
 attr_accessible :email, :zip, :cause
 validates :email, :zip, :presence => true
 validates :zip, :length => {:is => 5}
 validates :email, :length => {:maximum => 30} 

end
