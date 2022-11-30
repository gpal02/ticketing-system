class RegistrationMailer < ApplicationMailer
  default from: 'tickeingsystem@gmail.com'

  def registration_mail(id)
    @user = User.find(id)
    @url = "http://localhost:3000/users/new_login"
    mail(to: @user.email, subject: "Successfully Registered!")
    
  end
end
