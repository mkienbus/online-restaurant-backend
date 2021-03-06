class ReservationsController < ApplicationController
    before_action :authorize
    
    #GET to /reservations route for index
    def index 
        #@current_user.reservations to find all reservations for that logged in user
        reservations = @current_user.reservations
        render json: reservations, include: [:restaurant]
    end

    #POST to /reservations route for create
    def create
        reservation = Reservation.create(reservation_params)
        # UserMailer.with(user: @current_user).reservation_confirmation_email.deliver_now
        render json: reservation, status: :created
    end

    #PATCH to /reservations route for update
    def update

    end

    #DELETE to /reservations route for destroy
    def destroy
        reservation = Reservation.find(params[:id])
        reservation.destroy
        head :no_content
    end

    private

    def reservation_params
        params.permit(:user_id, :restaurant_id, :reservation_date)
    end
end
