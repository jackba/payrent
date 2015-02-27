class PaidRent < ActiveRecord::Base
  belongs_to :unit

  attr_accessor :runs
  
end
