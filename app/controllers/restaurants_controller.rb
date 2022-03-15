class RestaurantsController < ApplicationController
    skip_before_action :authorize 

    #GET /restaurants route
    def index
        restaurants = Restaurant.all
        render json: restaurants
    end

end
