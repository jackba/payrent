class UtilityCharge < ActiveRecord::Base
  belongs_to :property
  has_many :payments
end
