class UtilityChargesController < ApplicationController
  before_action :set_utility_charge, only: [:show, :edit, :update, :destroy]

  # GET /utility_charges
  # GET /utility_charges.json
  def index
    @utility_charges = UtilityCharge.all
  end

  # GET /utility_charges/1
  # GET /utility_charges/1.json
  def show
  end

  # GET /utility_charges/new
  def new
    @utility_charge = UtilityCharge.new
  end

  # GET /utility_charges/1/edit
  def edit
  end

  # POST /utility_charges
  # POST /utility_charges.json
  def create
    @utility_charge = UtilityCharge.new(utility_charge_params)

    respond_to do |format|
      if @utility_charge.save
        format.html { redirect_to @utility_charge, notice: 'Utility charge was successfully created.' }
        format.json { render action: 'show', status: :created, location: @utility_charge }
      else
        format.html { render action: 'new' }
        format.json { render json: @utility_charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /utility_charges/1
  # PATCH/PUT /utility_charges/1.json
  def update
    respond_to do |format|
      if @utility_charge.update(utility_charge_params)
        format.html { redirect_to @utility_charge, notice: 'Utility charge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @utility_charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /utility_charges/1
  # DELETE /utility_charges/1.json
  def destroy
    @utility_charge.destroy
    respond_to do |format|
      format.html { redirect_to utility_charges_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_utility_charge
      @utility_charge = UtilityCharge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def utility_charge_params
      params.require(:utility_charge).permit(:utility_name, :utility_charge, :utility_charge_date, :property_id)
    end
end
