class Location < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :deal_builders
end
