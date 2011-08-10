class DbStepOne < ActiveRecord::Base
   has_attached_file :company_logo, :styles => { :medium => "300x300",
                                         :thumb => "100x100" }
   has_attached_file :offer_photo, :styles => { :medium => "300x300",
                                         :thumb => "100x100" }
  belongs_to :deal_builder
end
