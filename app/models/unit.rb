class Unit < ActiveRecord::Base
  belongs_to :property
  has_one :user
  has_many :payments
end
