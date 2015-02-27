class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all
   
    @unit = current_user.unit
    
    @utility_charge = current_user.property.latest_utility_charge

    #Find the next month due from the paid_rents Table
    @paid_rent = PaidRent.all
    @current_due_date = PaidRent.where(paid: false, unit_id: @unit).first.date_due

    #the following code determines the date of the next rent payment
    #Create an array of the current users payment dates
    #@user_payments = Payment.where(user_id: current_user).pluck(:user_id,:created_at)

    #Pull out the payment dates from the plucked array into the last payment date and the next to last payment date
    #@last_payment = @user_payments.last
   # @last_pay_date = @last_payment[1]
    #@next_to_last_payment = @user_payments[(@user_payments.count)-2]
    #@next_to_last_paydate = @next_to_last_payment[1]

    #check the months the last two payments were made
    #if two payments made in the current month assume one is for the current month and the other is for the next month (scenario where
      #current month could be late and next month is early)
    #if one made last month and the second made this month then tenant is on track and next payment due in two months
    #assume current month is March
    #if @last_pay_date.strftime("%B %Y") == Date.today.at_beginning_of_month.strftime("%B %Y") #was the last payment made this month (March)
   #   if @next_to_last_paydate.strftime("%B %Y") == Date.today.at_beginning_of_month.strftime("%B %Y") #was the next to last payment made this month (March)
   #     @current_due_date = Date.today.at_beginning_of_month.next_month.next_month #then next payment due in two months (May)
    #  elsif @next_to_last_paydate.strftime("%B %Y") == 1.months.ago.strftime("%B %Y") #was the next to last payment made last month (February)
    #    @current_due_date = Date.today.at_beginning_of_month.next_month #then next payment is due next month (April)
    #  end
   
   # elsif @last_pay_date.strftime("%B %Y") && @next_to_last_paydate.strftime("%B %Y") == 1.months.ago.strftime("%B %Y") #if two payments made in previous month (February)
   #   @current_due_date = Date.today.at_beginning_of_month.next_month #next payment is due next month (April), assume payments are for February and March
   # else
   #   @current_due_date = Date.today.at_beginning_of_month
  #  end
    #also need to account for an empty payment table or table with only one entry
    #of course the tenant could be late for two months, but at that point they should have already been removed from the property.
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

    respond_to do |format|
      if @payment.save
        format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @payment }
      else
        format.html { render action: 'new' }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
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
      params.require(:payment).permit(:user_id, :unit_id, :utility_charge_id, :total_paid)
    end
end
