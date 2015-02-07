class Unit < ActiveRecord::Base
  belongs_to :property
  belongs_to :user
  has_many :payments
end
