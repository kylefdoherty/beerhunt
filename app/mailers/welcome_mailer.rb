class WelcomeMailer < ApplicationMailer
  default from: "kyledoherty22@gmail.com"

  def after_signup_welcome_email(user)
    @user = user
    mail(to: user.email, subject: "Welcome to Beerhunt")
  end
end
