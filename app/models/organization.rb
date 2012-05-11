class Organization < ActiveRecord::Base
  attr_accessible :email, :name, :first_name, :last_name, :address, :description, :city, :state, :zip, :title, :phone_number, :terms_of_use

 validates :email, :confirmation => true
 validates :name, :description, :address, :city, :state, :zip,
    :first_name, :last_name, :title, :email, :phone_number, 
    :presence => true
  validates :email, :confirmation => true
  validates :description, :length => {:maximum => 500 } 
  validates :name, :length => {:maximum => 30} 
  validates :website, :length => {:maximum => 50} 
  validates :address, :length => {:maximum => 70} 
  validates :city, :length => {:maximum => 30} 
  validates :zip, :length => {:is => 5}
  validates :state, :length => {:maximum => 15} 
  validates :first_name, :length => {:maximum => 20} 
  validates :last_name, :length => {:maximum => 20} 
  validates :title , :length => {:maximum => 20} 
  validates :email, :length => {:maximum => 30} 
  validates :phone_number, :length => {:maximum => 15} 

  validates :zip, :numericality => {:only_integer => true}

  validate :terms_check_box
   def terms_check_box
        errors.add(:terms_of_use, 'must be accepted.') if terms_of_use != 'yes'
   end


end
