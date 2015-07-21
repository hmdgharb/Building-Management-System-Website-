class Monthlybill < ActiveRecord::Base
  has_many :bills
  belongs_to :usr
end
