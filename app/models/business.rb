class Business < ActiveRecord::Base
  has_many :offers
  has_many :vouchers
  attr_accessible :name
  attr_accessible :description
  attr_accessible :phone_number
  attr_accessible :website
  attr_accessible :location
  attr_accessible :industry
  attr_accessible :logo
  attr_accessible :email
  attr_accessible :password
  attr_accessible :old_password
  attr_accessible :password_confirmation
  attr_accessor :password_confirmation
  attr_reader :password
  attr_reader :old_password

  has_attached_file :logo, :styles => { :medium => "300x300>",
                                         :thumb => "100x100>" }
  before_validation :business_strip_whitespace
  validates_attachment_content_type :logo, 
                                    :content_type => ['image/jpeg', 'image/png', 'image/gif'],
                                    :message => 'Please use a .jpeg, .png, or .gif image'
  validates_attachment_presence :logo
  validates_attachment_size :logo, :less_than => 15.megabytes
  validates :name, :description, :phone_number, :location, :industry, :logo, :email, :presence => true
  validates :name, :uniqueness => true

 validate :password_must_be_present
 validates :password, 
            :confirmation => true 
 validates_length_of :password, :minimum => 6, :maximum => 20, :allow_blank => true 

  def business_strip_whitespace
    self.name = self.name.strip unless self.name.blank?
  end 

  def Business.authenticate(email, password)
    if business = find_by_email(email)
      if business.hashed_password == encrypt_password(password, business.salt)
        return business 
      end 
    end 
    return nil 
  end 

  def Business.encrypt_password(password, salt)
    Digest::SHA2.hexdigest(password + "drpepperisgoodnotbad" + salt)
  end 

  def password=(password)
   @password = password
   if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password,salt)
    end
  end

  def old_password_check(old_password)
     unless !old_password.blank? && self.hashed_password == self.class.encrypt_password(old_password,self.salt)
       return false
     end
     return true
  end

  private

  def password_must_be_present
    errors.add(:password,"Missing Password") unless hashed_password.present?
  end


  

  def generate_salt
    self.salt = self.object_id.to_s  + rand.to_s
  end

  
end

