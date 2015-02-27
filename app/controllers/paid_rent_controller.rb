class PaidRentController < ApplicationController
  def index
  end

  def new
  end

  def create
  	@paid_rent = PaidRent.create()
  end
end
