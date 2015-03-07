class Unit < ActiveRecord::Base
  belongs_to :property
  belongs_to :user
  has_many :payments
  has_many :paid_rents
  
  validates :user_id, presence: true, numericality: {only_integer: true}
  validates :property_id, presence: true, numericality: {only_integer: true}
  validates :rent_charge, :security_charge, :description, presence: true
end
