class StripeChargesController < ApplicationController
	
	 def new
	 	@unit = current_user.unit
    @total_paid = ((@unit.rent_charge+current_user.property.latest_utility_charge)*100).round
	   @stripe_btn_data = {
	     key: "#{ Rails.configuration.stripe[:publishable_key] }",
	     description: "Rent Payment - #{current_user.name}",
	     amount: @total_paid
	   }
 	end

	def create
 		@unit = current_user.unit
    @total_paid = ((@unit.rent_charge+current_user.property.latest_utility_charge)*100).round
   # Creates a Stripe Customer object, for associating
   # with the charge
   customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )
 
   # Where the real magic happens
   charge = Stripe::Charge.create(
     customer: customer.id, # Note -- this is NOT the user_id in your app
     amount: @total_paid,
     description: "Rent Charges - #{current_user.email}",
     currency: 'usd'
   )
 	#Write payment details to the payments table
   @payment = Payment.create(total_paid: @total_paid/100, user_id: current_user.id, unit_id: current_user.unit.id, utility_charge_id: current_user.property.utility_charges.last.id  )
   @payment.save

   flash[:success] = "Thank you for your payment, #{current_user.email}!"
   redirect_to payments_path # or wherever
 
 # Stripe will send back CardErrors, with friendly messages
 # when something goes wrong.
 # This `rescue block` catches and displays those errors.
 rescue Stripe::CardError => e
   flash[:error] = e.message
   redirect_to new_stripe_charge_path
 end
end
