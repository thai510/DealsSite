class DbStepFour < ActiveRecord::Base
  has_and_belongs_to_many :incentive_ideas
  belongs_to :deal_builder

  validates :incentive_ideas, :presence => true
end
