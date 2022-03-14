class RestaurantsController < ApplicationController
    #skip_before_action :authorize 
    skip_before_action

    #GET /restaurants route
    #need restaurant seed data
    def index
        restaurants = Restaurant.all
        render json: restaurants
    end

end
