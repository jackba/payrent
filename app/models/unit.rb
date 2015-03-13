class Unit < ActiveRecord::Base
  belongs_to :property
  belongs_to :user
  has_many :payments
  has_many :paid_rents
  has_many :utility_charges
  
  validates :user_id, presence: true, numericality: {only_integer: true}
  validates :property_id, presence: true, numericality: {only_integer: true}
  validates :rent_charge, :security_charge, :description, presence: true
  
  #def latest_utility_charge
   #utility_charges.empty? ? 0 : utility_charges.last.utility_charge
	#end
  
  def latest_utility_charge
    if utility_charges.empty?
      0
    elsif utility_charges.last.is_paid
      0
    else
      utility_charges.last.utility_charge
    end
  end
  
  
end
