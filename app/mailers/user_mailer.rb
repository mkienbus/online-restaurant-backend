class UserMailer < ApplicationMailer
    default from: "notifications@example.com"

    def welcome_email
        @user = params[:user]
        @url = 'http://localhost:4000/login'
        mail(to: @user.email, subject: 'Welcome to Rezy!')
    end
end
