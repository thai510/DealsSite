class Voucher < ActiveRecord::Base
  belongs_to :non_profit
  belongs_to :offer
  belongs_to :business
  attr_accessible :email, :name, :non_profit_id, :email_confirmation,
     :offer_id
  validates :email, :name, :non_profit_id , :business_id, :offer_id,
     :presence => true
  validates :email, :confirmation => true
end
