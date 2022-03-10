class UsersController < ApplicationController
    #skip_before_acton, only: create

    # GET /users route
    def index
        users = User.all
        render json: users
    end

end
