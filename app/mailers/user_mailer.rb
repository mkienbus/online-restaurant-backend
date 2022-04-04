class UserMailer < ApplicationMailer
    # default from: "notifications@example.com"
    default from: "canonbusch@hotmail.com"

    def welcome_email
        @user = params[:user]
        @url = 'http://localhost:4000/restaurants'
        mail(to: @user.email, subject: 'Welcome to Rezy!')
    end
end
