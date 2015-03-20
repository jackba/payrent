class WelcomeMailer < ActionMailer::Base
  default from: "brookviewonellc@gmail.com"
  
  def welcome_email(user)
    @user = user
    mail(to: @user.email, cc: "brookviewonellc@gmail.com", subject: "Highbrook Properties Sign-Up")
  end
end
