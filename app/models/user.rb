class User < ActiveRecord::Base
   has_and_belongs_to_many :industries
   has_and_belongs_to_many :subindustries
   validates :name, :email,:zipcode,:password, :presence => true 
   
   #  validates :industry_ids, :presence => { 
    #         :message => 'Please choose at least one industry'}
                        
   validates :email , :uniqueness => true
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
