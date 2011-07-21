class Service < ActiveRecord::Base
   LOCATIONS = ["San Francisco", "Sunnyvale", "San Jose"] 

   attr_reader :phone_area
   attr_reader :phone_num1

   validate :area_code_must_be_present


  def phone_area=(phone_area)
    if phone_area.present?
      self.contact_phone = phone_area
    end
  end

  def phone_num1=(phone_num1)
    if phone_area.present? && phone_num1.present?
      self.contact_phone = "#{self.contact_phone}" +  "#{phone_num1}"
    end
  end
  

  
private
  def area_code_must_be_present
     errors.add(:contact_phone,"Missing Area Code") unless phone_area.present?
  end

  def phone_number_must_be_present
     errors.add(:contact_phone,"Missing phone number") unless phone_num1.present?
  end


end
