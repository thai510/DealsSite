class Location < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :db_step_twos
end
