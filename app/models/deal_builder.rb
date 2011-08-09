class DealBuilder < ActiveRecord::Base
   has_attached_file :logo, :styles => { :medium => "300x300",
                                         :thumb => "100x100" }
   has_attached_file :offer_photo, :styles => { :medium => "300x300",
                                         :thumb => "100x100" }
   has_and_belongs_to_many :standard_restrictions
   has_and_belongs_to_many :industry_restrictions
   has_and_belongs_to_many :incentive_ideas
   has_and_belongs_to_many :locations
   belongs_to :user
end
