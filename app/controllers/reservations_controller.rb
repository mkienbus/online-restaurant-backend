class ReservationsController < ApplicationController
    skip_before_action :authorize
    
    #GET to /reservations route for index
    def index 
        reservations = Reservation.all
        render json: reservations
    end

    #POST to /reservations route for create
    def create
        reservation = Reservation.create(reservation_params)
        render json: reservation, status: :created
    end

    #PATCH to /reservations route for update
    def update

    end

    #DELETE to /reservations route for destroy
    def destroy

    end

    private

    def reservation_params
        params.permit(:user_id, :restaurant_id, :reservation_date)
    end
end
