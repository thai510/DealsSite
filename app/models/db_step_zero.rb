class DbStepZero < ActiveRecord::Base
  belongs_to :user
   has_attached_file :company_logo, :styles => { :medium => "300x300>",
                                         :thumb => "100x100>" }

  validates :industry,:business_name,:business_description, :presence => true
  validates_attachment_content_type :company_logo, :content_type => ['image/jpeg','image/png', 'image/gif']
  
end
