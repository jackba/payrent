class Property < ActiveRecord::Base
	has_many :utility_charges
	has_many :units
	has_many :users, through: :unit
end
