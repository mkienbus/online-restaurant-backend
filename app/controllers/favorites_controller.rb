class FavoritesController < ApplicationController

    def index
        favorites = @current_user.favorites
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
        params.permit(:user_id, :favorite)
    end
end
