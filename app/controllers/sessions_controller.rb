class SessionsController < ApplicationController
    #skip_before_action :authorize, only: :create

    #POST /login route
    def create
        user = User.find_by(username: params[:username])

        if (user) #<-- add inside once passwords are up user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user, status: :created
        else 
            render json: { error: "Invalid username or password" }, status: :unauthorized
        end
    end

    #DELETE /logout route
    def destroy
        def destroy
            session.delete :user_id
            head :no_content
        end
    end
end
