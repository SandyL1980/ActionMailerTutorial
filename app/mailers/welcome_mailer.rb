class WelcomeMailer < ActionMailer::Base
  default from: "hello@mysite.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://test.com/login'
    mail(to: @user.email, subject: 'My awesome email')
  end
end
