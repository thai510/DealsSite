class Offer < ActiveRecord::Base
  belongs_to :business 
  attr_accessible :headline
  attr_accessible :description
  attr_accessible :fine_print
  attr_accessible :address
  attr_accessible :city
  attr_accessible :state
  attr_accessible :zip
  attr_accessible :exipiration_date
  attr_accessible :photo
  #live values
  # 0: offer just created, not live, can be edited
  # 1: offer is live and accepting customers, can't be edited
  # 2: offer has finished and is not accepting customers, can't be edited 
  attr_accessible :live
  attr_accessible :business_id
  attr_reader :start_offer_now

  validates :headline, :description, :fine_print, :address, 
    :city, :state, :zip, :live, :presence => true

  has_attached_file :photo, :styles => { :large => "500x500>",
                                         :medium => "300x300>",
                                         :thumb => "100x100>" }
  validates_attachment_content_type :photo, 
                                    :content_type => ['image/jpeg', 'image/png', 'image/gif'],
                                    :message => 'Please use a .jpeg, .png, or .gif image'
  validates :expiration_date,
    :date => {:after => Proc.new { Time.now},:message => 'must be after today'}

  validates :start_date,
    :date => {:before => :expiration_date  }

end
