class Payment < ActiveRecord::Base
  belongs_to :user
  belongs_to :unit
  has_many :utility_charges
  
  validates :user_id, :unit_id, :utility_charge_id, presence: true, numericality: {only_integer: true}
  validates :total_paid, :rent_paid, :security_paid, presence: true, numericality: true
  validates :pay_type, presence: true
  
end
