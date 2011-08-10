class DealBuilder < ActiveRecord::Base
   has_attached_file :logo, :styles => { :medium => "300x300",
                                         :thumb => "100x100" }
   has_attached_file :offer_photo, :styles => { :medium => "300x300",
                                         :thumb => "100x100" }
   has_one :db_step_one, :dependent => :destroy
   has_one :db_step_two, :dependent => :destroy
   has_one :db_step_three, :dependent => :destroy
   has_one :db_step_four, :dependent => :destroy
   belongs_to :user

#   validates :deal_builders_locations, :presence => true
 #:business_name, :offer_title, :logo, :industry, :offer_value,
             #:offer_price, :offer_description, :offer_photo,:offer_launch_date,
end
