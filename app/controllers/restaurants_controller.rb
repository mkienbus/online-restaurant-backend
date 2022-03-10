class RestaurantsController < ApplicationController

    #GET /restaurants route
    #need restaurant seed data
    def index
        restaurants = Restaurant.all
        render json: restaurants
    end

end
