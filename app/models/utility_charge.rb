class UtilityCharge < ActiveRecord::Base
  belongs_to :property
  belongs_to :payments
  has_many :users, through: :payments
end
