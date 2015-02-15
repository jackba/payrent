class Property < ActiveRecord::Base
	has_many :utility_charges
	has_many :units
	has_many :users, through: :units

	def latest_utility_charge
			#utility_charges.last.utility_charge / users.count
	end
	
end
