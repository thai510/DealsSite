class Admin < ActiveRecord::Base
 attr_accessible :password, :username, :password_confirmation
 validates :username, :presence => true  
 validates :password, 
            :confirmation => true, 
            :length => {:within => 6..40}
 validate :password_must_be_present
 before_validation :admin_strip_whitespace
 attr_accessor :password_confirmation
 attr_reader :password

  def admin_strip_whitespace
    self.username = self.username.strip unless self.username.blank?
  end 

  def Admin.authenticate(username, password)
    if admin = find_by_username(username)
      if admin.hashed_password == encrypt_password(password, admin.salt)
        return admin 
      end 
    end 
    return nil 
  end 

def Admin.encrypt_password(password, salt)
    Digest::SHA2.hexdigest(password + "drpepperisgoodrealgood" + salt)
  end 

  def password=(password)
   @password = password
   if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password,salt)
    end
  end

  private

  def password_must_be_present
    errors.add(:password,"Missing Password") unless hashed_password.present?
  end

  def generate_salt
    self.salt = self.object_id.to_s  + rand.to_s
  end
end
