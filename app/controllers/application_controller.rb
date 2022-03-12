class ApplicationController < ActionController::Base
    include ActionController::Cookies

    #before_action :authorize

    private

    #currently not being used on any controllers
    def authorize
        @current_user = User.find(session[:user_id])
        render json: {errors: ["Not authorized"]}, status: :unauthorized unless @current_user
    end
end
