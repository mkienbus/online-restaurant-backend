class UsersController < ApplicationController
    #skip_before_acton, only: create
    skip_before_action

    # GET /users route
    def index
        users = User.all
        render json: users
    end

    #GET route
    def show
        render json: @current_user
    end

end
