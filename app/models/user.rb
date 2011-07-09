class User < ActiveRecord::Base
   INDUSTRIES = ["Restaurant", "Construction", "Shop", "Wrestling"]

   validates :name, :email,:zipcode,:industry,:password, :presence => true 
   validates :email , :uniqueness => true
   #validates :email, :format => { 
    #  :with => %r{[a-z 0-9 ! # $ % & ' * + / = ? ^ _ ` { | } ~ - [ + ( ? : \ . [ a-z 0 - 9}i,
      #:message => 'must be valid email'}
   validates :password, :length => {:minimum => 6, :maximum => 20}
   validates :password, :confirmation => true
   validates  :zipcode, :length => {:is => 5}

   attr_accessor :password_confirmation
   attr_reader :password

   validate :password_must_be_present

     def User.authenticate(email, password)
       if user = find_by_email(email)
         if user.hashed_password == encrypt_password(password, user.salt)
           return user
         end
       end
       return nil
     end

     def User.encrypt_password(password, salt)
       Digest::SHA2.hexdigest(password + "offerglass" + salt)
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
       errors.add(:password,"Missing password") unless hashed_password.present?
     end


     def generate_salt
       self.salt = self.object_id.to_s + rand.to_s
     end
end
