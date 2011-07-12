class Service < ActiveRecord::Base
   serialize :locations_served
   LOCATIONS = ["San Francisco", "Sunnyvale", "San Jose"] 
end
