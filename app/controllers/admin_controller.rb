class AdminController < ApplicationController
	before_action :require_admin
  def index
  	@properties = Property.all
  	@users = User.all
  	@units = Unit.all
  	@utility_charges = UtilityCharge.all

  	@property = Property.new
  	@unit = Unit.new
  	@utility_charge = UtilityCharge.new
  	@user = User.new
  	@payment = Payment.new
  end
end
