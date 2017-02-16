class UserMailer < ApplicationMailer
  default from: 'notifications@99cats.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://99cats.com/login'
    mail(to: user.email, subject: 'Welcome to 99cats!')
  end
end
