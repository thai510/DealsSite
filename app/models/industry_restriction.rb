class IndustryRestriction < ActiveRecord::Base
 belongs_to :industries
 has_and_belongs_to_many :deal_builders
end
