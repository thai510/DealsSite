class ReviewEntry < ActiveRecord::Base
   validates :service,:number_of_vouchers, :offer, :level_of_new_business,
     :returning_new_customers, :overall_experience, :presence => true

   #validates :number_of_vouchers, :format => {
    #    :with => /^[0-9]+$/,
     #   :message => 'Must be an integer'}
   
   validates :number_of_vouchers, :numericality => {:greater_than_or_equal_to => 0} 
end
