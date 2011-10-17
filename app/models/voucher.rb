class Voucher < ActiveRecord::Base
  belongs_to :user
  belongs_to :prev_publish
  belongs_to :db_publish

  validates :code, :uniqueness => true
end
