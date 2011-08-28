class DbStepThree < ActiveRecord::Base
  has_and_belongs_to_many :standard_restrictions
  belongs_to :deal_builder

  validates :standard_restrictions, :presence => true

end
