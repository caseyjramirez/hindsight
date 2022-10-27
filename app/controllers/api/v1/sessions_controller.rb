class Api::V1::SessionsController < ApplicationController
    skip_before_action :authorized_user, only: [:login]

    def login
        mentor = Mentor.find_by(email: params[:email])
        mentee = Mentee.find_by(email: params[:email])
        
        if mentor&.authenticate(params[:password])
            session[:user_id] = mentor.id
            render json: mentor, status: :ok
        elsif mentee&.authenticate(params[:password])
            session[:user_id] = mentee.id
            render json: mentee, status: :ok
       else
            render json: {errors: "Invalid pasword or username"}, status: :unauthorized
       end
    end

    def show
        render json: current_user, status: :ok
    end
end
