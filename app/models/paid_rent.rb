class PaidRent < ActiveRecord::Base
  belongs_to :unit

  attr_accessor :runs
  
  validates :unit_id, presence: true
  
end
