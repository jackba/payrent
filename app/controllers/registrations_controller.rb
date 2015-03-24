class RegistrationsController < Devise::RegistrationsController
  
  def create
    super
    if @user.persisted?
      WelcomeMailer.welcome_email(@user).deliver
    end
  end
    
end