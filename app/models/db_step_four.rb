class DbStepFour < ActiveRecord::Base
  belongs_to :deal_builder

  validate do |model|
    if fb_incentive == 'yes' && fb_incentive_text.blank?
      model.errors.add_to_base("Please provide an incentive for sharing on Facebook. Otherwise uncheck the box.")
    end
  end
end
