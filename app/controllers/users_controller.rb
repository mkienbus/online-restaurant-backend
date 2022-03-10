class UsersController < ApplicationController

    # GET route
    def index
        users = User.all
        render json: users
    end

end
