class DbPublish < ActiveRecord::Base
  belongs_to :deal_builder
  has_many :private_deal_codes, :dependent => :destroy
  
  
  validates :max_vouchers_to_sell, :length_of_deal,:presence => true
  validates :max_vouchers_to_sell, :length_of_deal, :numericality => {:greater_than_or_equal_to => 0}
end
