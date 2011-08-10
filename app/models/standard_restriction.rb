class StandardRestriction < ActiveRecord::Base
  has_and_belongs_to_many :db_step_threes 
end
