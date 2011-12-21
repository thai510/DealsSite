class NonProfit < ActiveRecord::Base
  has_and_belongs_to_many :causes
   has_attached_file :np_photo, :styles => { :medium => "300x300",
                                         :thumb => "100x100", :mediumthumb => "150x150", :small => "50x50" }
end
