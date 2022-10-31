class Api::V1::SessionsController < ApplicationController
    # skip_before_action :authorized_user, only: [:login]

    def login
        user = User.find_by(email: params[:email])
        
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user, status: :ok
       else
            render json: {errors: "Invalid pasword or username"}, status: :unauthorized
       end
    end

    def logout
        session.delete(:user_id)
        head :no_content
    end

    def show
        render json: current_user, status: :ok
    end
end
