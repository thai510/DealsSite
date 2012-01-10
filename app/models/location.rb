class Location < ActiveRecord::Base
  STATES = %w{AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI 
            MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT 
            VT VA WA WV WI WY}
  has_many :db_step_twos

  validates :address, :city, :state, :zip, :presence => true
  validates :zip, :length => {:minimum => 5, :maximum => 5 } ,:if => :zip
  validates :zip, :numericality => {:only_integer => true}, :if => :zip
end
