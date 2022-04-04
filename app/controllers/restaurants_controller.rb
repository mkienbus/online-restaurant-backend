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

    #PATCH /restaurants/:id route to update
    def update
        restaurant = Restaurant.find(params[:id])
        restaurant.update(restaurant_params)
        render json: restaurant
    end

    private
    def restaurant_params
        params.require(:restaurant).permit(:favorite, :user_id)
    end

end
