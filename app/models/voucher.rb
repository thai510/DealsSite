class Voucher < ActiveRecord::Base
  belongs_to :non_profit
  belongs_to :offer
  belongs_to :business
  attr_reader :email_list
  attr_accessible :email, :name, :non_profit_id, :email_confirmation,
     :offer_id, :email_list, :note
  validates :email, :name, :non_profit_id , :business_id, :offer_id,
     :code, :redeemed, :presence => true
  validates :email, :confirmation => true
  validates :code, :uniqueness => true
  validates :name, :length => {:maximum => 30}
  validates :email, :length => {:maximum => 30}
  validates :note, :length => {:maximum => 65}
  validates :purchase, :numericality => true, :on => :update
  validate :validate_purchase, :on => :update
  def validate_purchase 
    errors.add(:purchase, "should be at least 0.01") if purchase.nil? || purchase < 0.01 
  end
end
