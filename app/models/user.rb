class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  

  
  has_one :unit
  has_one :property, through: :unit
  has_many :utility_charges, through: :payments
  has_many :payments
  
  
    
end
