class DbPublish < ActiveRecord::Base
  belongs_to :deal_builder
  
  
  validates :max_vouchers_to_sell, :length_of_deal,:presence => true
  validates :max_vouchers_to_sell, :length_of_deal, :numericality => {:greater_than_or_equal_to => 0}
end
