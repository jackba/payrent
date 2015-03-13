class UtilityCharge < ActiveRecord::Base
  belongs_to :unit
  has_many :payments
  has_many :users, through: :payments
  
  validates :utility_name, :utility_charge_date, :unit_id, presence: true
  validates :utility_charge, presence: true, numericality: true
end
