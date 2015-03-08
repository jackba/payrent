class PaidRentsController < ApplicationController
	before_action :require_admin

  def index
    #@paid_rents = PaidRent.all
    @paid_rents = PaidRent.paginate(page: params[:page], per_page: 15)
    @month_sort = @paid_rents.group_by { |t| t.date_due.beginning_of_month }
  end

  def create
    runs = params[:paid_rent][:runs].blank? ? 0 : params[:paid_rent][:runs].to_i 
    success = false
    date = Date.new(params[:paid_rent]["date_due(1i)"].to_i, params[:paid_rent]["date_due(2i)"].to_i, params[:paid_rent]["date_due(3i)"].to_i)
    (0 .. runs).each do |month_increment|
      success = PaidRent.create(unit_id: params[:paid_rent][:unit_id], date_due: date + month_increment.months )
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
