class Payment < ActiveRecord::Base
  belongs_to :user
  belongs_to :unit
  has_many :utility_charge
end
