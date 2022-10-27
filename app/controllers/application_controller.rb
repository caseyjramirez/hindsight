class ApplicationController < ActionController::API
    include ActionController::Cookies
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    # before_action
    before_action :authorized_user


    def hello_world
        session[:count] = (session[:count] || 0) + 1
        render json: { count: session[:count] }
      end

    # current_user and authorized_user 
    def current_user
        mentee = Mentee.find_by(id: session[:user_id])
        mentor = Mentor.find_by(id: session[:user_id])
        mentee if mentee
        mentor if mentor
    end

    def authorized_user
        render json: {error: "Not Authorized"}, status: :unauthorized unless current_user
        # render json: {error: "Not Authorized"}, status: :unauthorized
    end

    private

    def render_unprocessable_entity(invalid)
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end 

    def render_not_found(error)
        render json: {errors: {error.model => "Not Found"}}, status: :not_found
    end 
end
