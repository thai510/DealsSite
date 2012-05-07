class Customer < ActiveRecord::Base
 validates :email, :zip, :presence => true
 validates :zip, :length => {:is => 5}
 validates :email, :length => {:maximum => 30} 
end
