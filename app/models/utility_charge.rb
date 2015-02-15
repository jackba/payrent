class UtilityCharge < ActiveRecord::Base
  belongs_to :property
  has_many :payments
  has_many :users, through: :payments
end
