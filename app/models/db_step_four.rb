class DbStepFour < ActiveRecord::Base
  belongs_to :deal_builder

  validates :fb_incentive_text, :presence => true, :if => "fb_incentive == 'yes'"
end
