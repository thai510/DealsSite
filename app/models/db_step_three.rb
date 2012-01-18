class DbStepThree < ActiveRecord::Base
  has_and_belongs_to_many :standard_restrictions
  belongs_to :deal_builder

validate do |model|
     model.errors.add_to_base("At least one Standard Restriction is required") if standard_restrictions.blank?
     model.errors.add_to_base("Please provide a Voucher Length") if voucher_length.blank?
 end

end
