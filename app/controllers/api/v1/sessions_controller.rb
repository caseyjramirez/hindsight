class SessionsController < ApplicationController
    def mentor_login
        mentor = Mentor.find_by(email: params[:email])
        if mentor&.authenticate(params[:password])
            session[:user_id] = mentor.id
            render json: mentor, status: :ok
       else
            render json: {errors: "Invalid pasword or username"}
       end
    end

    def mentee_login
        mentee = Mentee.find_by(email: params[:email])
        if mentee&.authenticate(params[:password])
            session[:user_id] = mentor.id
            render json: mentee, status: :ok
       else
            render json: {errors: "Invalid pasword or username"}
       end
    end
end
