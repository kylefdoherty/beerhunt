# Preview all emails at http://localhost:3000/rails/mailers/welcome_mailer
class WelcomeMailerPreview < ActionMailer::Preview
  def after_signup_welcome_email
    WelcomeMailer.after_signup_welcome_email(User.first)
  end
end
