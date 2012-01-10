class DbStepThree < ActiveRecord::Base
  has_and_belongs_to_many :standard_restrictions
  belongs_to :deal_builder

  validates :standard_restrictions,:voucher_length, :presence => true
  validates :voucher_length, :numericality => {:only_integer => true,
    :greater_than => 0, :less_than => 13}, :if => :voucher_length 

end
