class UsersController < ApplicationController
    skip_before_action :authorize, only: :create

    # GET /users route
    def index
        users = User.all
        render json: users
    end

     #GET route
     def show
        render json: @current_user
    end

    #POST route for signup
    def create
        user = User.create(user_params)
        session[:user_id] = user.id

        if user.valid?
        render json: user, status: :created

        else
            render json: {errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.permit(:username, :password, :password_confirmation)
    end

end