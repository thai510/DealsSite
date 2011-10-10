class PrevPublish < ActiveRecord::Base
  belongs_to :user
  has_many :vouchers
end
