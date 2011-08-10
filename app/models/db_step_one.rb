class DbStepOne < ActiveRecord::Base
   has_attached_file :company_logo, :styles => { :medium => "300x300",
                                         :thumb => "100x100" }
   has_attached_file :offer_photo, :styles => { :medium => "300x300",
                                         :thumb => "100x100" }
  belongs_to :deal_builder


  validates :business_name,:offer_title, :offer_value, :industry,
            :offer_description,:offer_price, :presence => true

  validates :offer_price, :numericality => {:greater_than_or_equal_to => 0}
  validates :offer_value, :numericality => {:greater_than => 0}
  validates_attachment_presence :company_logo
  validates_attachment_content_type :company_logo, :content_type => ['image/jpeg','image/png']
  validates_attachment_content_type :offer_photo, :content_type => ['image/jpeg','image/png']
end
