class DbStepTwo < ActiveRecord::Base
  has_many :locations, :dependent => :destroy
  accepts_nested_attributes_for :locations, :allow_destroy => true
  belongs_to :deal_builder

  validate do |model|
    model.errors.add_to_base("Please provide an Address") if self.locations[0].address.blank?
    model.errors.add_to_base("Please provide a City") if self.locations[0].city.blank?
    model.errors.add_to_base("Please provide a State") if self.locations[0].state.blank?
    model.errors.add_to_base("Please provide a Zipcode") if self.locations[0].zip.blank?
    if (self.locations[0].zip && self.locations[0].zip.to_s.length != 5)
      model.errors.add_to_base("Zipcode must contain only integers and be 5 digits long")  
    end
  end
end
