class NonProfit < ActiveRecord::Base
  has_many :vouchers   
  attr_accessible :title, :description, :website, :photo

  validates :title, :description, :presence => true
  validates :title, :uniqueness => true

  has_attached_file :photo, :styles => { :large => "500x500>",
                                         :medium => "300x300>",
                                         :list => "285x300",
                                         :thumb => "100x100>" }
  validates_attachment_content_type :photo, 
                                    :content_type => ['image/jpeg', 'image/png', 'image/gif'],
                                    :message => 'Please use a .jpeg, .png, or .gif image'
end
