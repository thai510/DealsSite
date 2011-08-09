class StandardRestriction < ActiveRecord::Base
  has_and_belongs_to_many :deal_builders 
end
