class Unit < ActiveRecord::Base
  belongs_to :property
  belongs_to :user
  has_many :payments
  has_many :paid_rents
end
