class Subindustry < ActiveRecord::Base
  belongs_to :industry
  has_and_belongs_to_many :users

  
end
