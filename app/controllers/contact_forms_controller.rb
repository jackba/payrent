class ContactFormsController < ApplicationController
  def new
    @contact_form = ContactForm.new
    @properties = Property.all
  end

  def create
    @contact_form = ContactForm.new(params[:contact_form])
    @contact_form.request = request
    if @contact_form.deliver
      flash[:notice] = 'Thank you for your submission. We will contact you soon!'
      redirect_to :back
    else
      flash[:error] = 'There was a problem with the form.  Please ensure that the required fields are filled in properly.  Thank You!'
      redirect_to :back
    end
  end
end
