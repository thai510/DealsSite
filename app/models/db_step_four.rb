class DbStepFour < ActiveRecord::Base
  has_and_belongs_to_many :incentive_ideas
  belongs_to :deal_builder

  validates :fb_incentive_text, :presence => true, :if => "fb_incentive == 'yes'"
end
