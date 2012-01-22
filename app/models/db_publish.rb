class DbPublish < ActiveRecord::Base
  belongs_to :deal_builder
  has_many :private_deal_codes, :dependent => :destroy
  has_many :facebook_share_codes, :dependent => :destroy
  has_many :vouchers
  has_and_belongs_to_many :non_profits
  
  validate do |model|
    model.errors.add_to_base("At least one Non Profit is required") if non_profits.blank?
  end
  validates :max_vouchers_to_sell, :length_of_deal,:presence => true
  validates :max_vouchers_to_sell, :length_of_deal, :numericality => {:greater_than_or_equal_to => 0}
end
