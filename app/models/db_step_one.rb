class DbStepOne < ActiveRecord::Base
   has_attached_file :offer_photo, :styles => { :medium => "300x300",
                                         :thumb => "100x100" }
  belongs_to :deal_builder


  validates :offer_title, :offer_value, 
            :offer_description,:offer_price, :presence => true

  validates :offer_price, :numericality => {:greater_than_or_equal_to => 0}
  validates :offer_value, :numericality => {:greater_than_or_equal_to => 0}
  validates_attachment_content_type :offer_photo, :content_type => ['image/jpeg','image/png','image/gif']
end
