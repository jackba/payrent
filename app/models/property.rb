class Property < ActiveRecord::Base
	has_many :utility_charges
	has_many :units
end
