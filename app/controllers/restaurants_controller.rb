class RestaurantsController < ApplicationController
    skip_before_action :authorize 

    #GET /restaurants route for index
    def index
        restaurants = Restaurant.all
        render json: restaurants
    end

    #GET /restaurants route to show 
    def show
        restaurant = Restaurant.find(params[:id])
        render json: restaurant
    end

end
