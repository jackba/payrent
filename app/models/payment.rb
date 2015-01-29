class Payment < ActiveRecord::Base
  belongs_to :user
  belongs_to :unit
  belongs_to :utility_charge
end
