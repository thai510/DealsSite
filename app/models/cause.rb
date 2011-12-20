class Cause < ActiveRecord::Base
  has_and_belongs_to_many :non_profits 
end
