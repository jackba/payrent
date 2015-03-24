class RegistrationsController < Devise::RegistrationsController
  
  def create
    super
    Rails.logger.info ">>>> #{@user.inspect}"
    Rails.logger.info ">>> #{current_user.inspect}"
    if @user.persisted?
      WelcomeMailer.welcome_email(@user).deliver
    end
  end
    
end