class DbPublish < ActiveRecord::Base
  belongs_to :deal_builder
  
  
  #validates :max_vouchers_to_sell, :length_of_deal,:presence => true
  #make sure it's a number, and is at the least 0
end
