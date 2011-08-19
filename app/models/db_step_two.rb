class DbStepTwo < ActiveRecord::Base
  has_many :locations, :dependent => :destroy
  accepts_nested_attributes_for :locations, :allow_destroy => true
  belongs_to :deal_builder

  validates :offer_launch_date, :locations, :presence => true
end
