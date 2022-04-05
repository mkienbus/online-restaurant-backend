class FavoritesController < ApplicationController

    #GET route for favorites, using custom favorite method from restaurant model
    def favorites
        restaurants = Restaurant.favorite
        render json: restaurants
    end

    def index
        favorites = Favorite.all
        render json: favorites
    end

    def create
        favorite = Favorite.create(favorite_params)
        render json: favorite, status: :created
    end

    def update
        favorite = Favorite.find(params[:id])
        favorite.update(favorite_params)
        render json: favorite
    end

    def destroy
        reservation = Reservation.find(params[:id])
        reservation.destroy
        head :no_content
    end

    private

    def favorite_params
        params.permit(:user_id, :restaurant_id)
    end
end