class DbStepOne < ActiveRecord::Base
   has_attached_file :offer_photo, :styles => { :medium => "300x300",
                                         :thumb => "100x100", :mediumthumb => "150x150" }
  belongs_to :deal_builder

 validate do |model|
     model.errors.add_to_base("Please provide an Offer Title") if offer_title.blank?
     model.errors.add_to_base("Please provide an Offer Description") if offer_description.blank?
     model.errors.add_to_base("Please provide an Offer Value") if offer_value.blank?
     model.errors.add_to_base("Please provide an Offer Price") if offer_price.blank?
     if(!offer_price.blank? && !offer_value.blank? &&  offer_price >= offer_value)
       model.errors.add_to_base("Offer Price must be less than the Offer Value")
     end
 end

  validates :offer_value, :numericality => {:greater_than_or_equal_to => 0}, :if => :offer_value 
  validates :offer_price, :numericality => {:greater_than_or_equal_to => 0}, :if => :offer_price
  
  validates_attachment_content_type :offer_photo, :content_type => ['image/jpeg','image/png','image/gif']
  
end
