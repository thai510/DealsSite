class Service < ActiveRecord::Base
   LOCATIONS = ["San Francisco", "Sunnyvale", "San Jose"] 

   validate :contact_phone, :presence => true
   validate :contact_phone, :length => {:is => 10}


  


end
