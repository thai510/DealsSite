class Industry < ActiveRecord::Base
  has_many :subindustries, :dependent => :destroy
  has_many :industry_restrictions, :dependent => :destroy
  has_and_belongs_to_many :users

end
