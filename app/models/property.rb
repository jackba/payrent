class Property < ActiveRecord::Base
	has_many :utility_charges
	has_many :units
	has_many :users, through: :units
  
  validates :name, :address, presence: true

	def latest_utility_charge
    utility_charges.empty? ? 0 : (utility_charges.last.utility_charge / utility_charges.last.tenant_count)
	end
	 
end
