class DbStepThree < ActiveRecord::Base
  has_and_belongs_to_many :standard_restrictions
  has_and_belongs_to_many :industry_restrictions
  belongs_to :deal_builder

  validates :standard_restrictions,:industry_restrictions, :presence => true
end
