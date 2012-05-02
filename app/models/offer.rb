class Offer < ActiveRecord::Base
  belongs_to :business 
  attr_accessible :headline
  attr_accessible :description
  attr_accessible :fine_print
  attr_accessible :address
  attr_accessible :city
  attr_accessible :state
  attr_accessible :zip
  #attr_accessible :expiration_date
  #attr_accessible :start_date
  attr_accessible :photo
  #live values
  # 0: offer just created, not live, can be edited
  # 1: offer is live and accepting customers, can't be edited
  # 2: offer has finished and is not accepting customers, can't be edited 
  attr_accessible :live
  attr_accessible :business_id
  attr_accessible :start_offer_now
  has_many :vouchers
  attr_reader :start_offer_now

  validates :headline, :description, :fine_print, :address, 
    :city, :state, :zip, :live, :presence => true

  has_attached_file :photo, :styles => { :large => "500x500>",
                                         :medium => "300x300>",
                                         :thumb => "100x100>" }
  validates_attachment_content_type :photo, 
                                    :content_type => ['image/jpeg', 'image/png', 'image/gif'],
                                    :message => 'Please use a .jpeg, .png, or .gif image'
  #validate :expiration_date_after_today
  #validate :start_date_before_expiration_date
  #validate :start_date_after_today 

  def expiration_date_after_today
    errors.add(:expiration_date, 'must be after today') if expiration_date <= Time.now
  end

  def start_date_before_expiration_date
    errors.add(:start_date, 'must be before the expiration date') if start_date >= expiration_date 
  end

  def start_date_after_today
  if start_date < Time.now && live == 0 
    errors.add(:start_date, 'must be after today, choose start immediately if you wish to start today!') 
  end
  end


end
