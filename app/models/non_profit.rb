class NonProfit < ActiveRecord::Base
  has_many :vouchers   
  attr_accessible :title, :description

  validates :title, :description, :presence => true
end
