class Unit < ActiveRecord::Base
  belongs_to :property
  has_one :user
end
