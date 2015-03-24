class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all
   
    @unit = current_user.unit
    
    @utility = UtilityCharge.all
    
    @utility_charge = current_user.unit.present? ? current_user.unit.latest_utility_charge : 0
    
    #Find the next month due from the paid_rents Table
    @paid_rent = PaidRent.all
    last_unpaid_rent_for_unit = PaidRent.where(paid: false, unit_id: @unit).first
    @current_due_date = last_unpaid_rent_for_unit.present? ? last_unpaid_rent_for_unit.date_due : nil
    
    #determine if security deposit has been paid and assign it a variable for use in the view 
    @security_amount = current_user.unit.present? ? @unit.security_charge : 0
          
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new
  end

  # GET /payments/1/edit
  def edit

  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = Payment.new(payment_params)

      if @payment.save
        flash[:notice] = "Payment was successfully created."
        redirect_to admin_path
        #format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
        #format.json { render action: 'show', status: :created, location: @payment }
      else
        flash[:error] = "There was a problem saving the payment.  Please ensure that all fields are filled in properly."
        redirect_to admin_path
        #format.html { render action: 'new' }
        #format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:user_id, :unit_id, :utility_charge_id, :total_paid, :pay_type)
    end
end
