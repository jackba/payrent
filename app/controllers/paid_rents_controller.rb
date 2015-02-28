class PaidRentsController < ApplicationController
	before_action :require_admin

  def index
  end

  def create
    runs = params[:paid_rent][:runs].blank? ? 0 : params[:paid_rent][:runs].to_i 
    #Rails.logger.info ">>>  #{runs.inspect}"
    success = false
    date = Date.new(params[:paid_rent]["date_due(1i)"].to_i, params[:paid_rent]["date_due(2i)"].to_i, params[:paid_rent]["date_due(3i)"].to_i)
    (0 .. runs).each do |month_increment|
      success = PaidRent.create(unit_id: params[:paid_rent][:unit_id], date_due: date + month_increment.months )
      #Rails.logger.info ">>>> rent paid created: #{month_increment}"
      break unless success
    end

  	 if success
        flash[:notice] = "Rent Due Date succesfully created."
        redirect_to :back
  	 else
	  	 	flash[:error] = "There was a problem saving the rent due date."
	      redirect_to :back
	   end
  end

	private
		def paid_rent_params
			params.require(:paid_rent).permit(:unit_id, :date_due)
		end


end
