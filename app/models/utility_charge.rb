class UtilityCharge < ActiveRecord::Base
  belongs_to :property
  has_many :payments
  has_many :users, through: :payments
  
  validates :utility_name, :utility_charge_date, presence: true
  validates :utility_charge, presence: true, numericality: true
  validates :property_id, numericality: {only_integer: true}
end
