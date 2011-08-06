class DealBuilder < ActiveRecord::Base
   has_attached_file :logo, :styles => { :medium => "300x300",
                                         :thumb => "100x100" }
   has_attached_file :offer_photo, :styles => { :medium => "300x300",
                                         :thumb => "100x100" }
end
