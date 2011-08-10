class IndustryRestriction < ActiveRecord::Base
 belongs_to :industries
 has_and_belongs_to_many :db_step_threes
end
