class Property < ActiveRecord::Base
	has_many :units
	has_many :users, through: :units
  
  validates :name, :address, presence: true
	 
end
