class DbStepOne < ActiveRecord::Base
   has_attached_file :offer_photo, :styles => { :medium => "300x300",
                                         :thumb => "100x100", :mediumthumb => "150x150" }
  belongs_to :deal_builder



 validate do |model|
     model.errors.add_to_base("Please provide an Offer Title.") if offer_title.blank?
     model.errors.add_to_base("Please provide an Offer Description.") if offer_description.blank?
 end



  validates :offer_price, :offer_value ,:presence => true, :if => "coupon == 'no'"

  validates :offer_value, :numericality => {:greater_than_or_equal_to => 0}, :if => :offer_value 
  validates :offer_price, :numericality => {:greater_than_or_equal_to => 0}, :if => :offer_price 
  validates :offer_price, :numericality => {:less_than => :offer_value}, :if => :offer_price && :offer_value 
  validates_attachment_content_type :offer_photo, :content_type => ['image/jpeg','image/png','image/gif']
  
end
