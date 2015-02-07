class AdminController < ApplicationController
  def index
  	@properties = Property.all
  	@users = User.all

  	@property = Property.new
  	@unit = Unit.new
  	@utility_charge = UtilityCharge.new
  	@user = User.new
  	@payment = Payment.new
  end
end
