class Api::V1::MentorsController < ApplicationController
  before_action :set_mentor, only: %i[ show update destroy ]
  skip_before_action :authorized_user, only: [:create]

  # GET /mentors
  def index
    @mentors = Mentor.all

    render json: @mentors
  end

  # GET /mentors/1
  def show
    render json: @mentor
  end

  # POST /mentors
  def create
    mentor = Mentor.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      community_id: Community.first.id,
      password: params[:password],
    )
    
    session[:user_id] = mentor.id
    render json: mentor, status: :created
  end

  # PATCH/PUT /mentors/1
  def update
    if @mentor.update(mentor_params)
      render json: @mentor
    else
      render json: @mentor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /mentors/1
  def destroy
    @mentor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mentor
      @mentor = Mentor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mentor_params
      params.require(:mentor).permit(:first_name, :last_name, :email, :age, :phone_number, :description, :community_id, :password)
    end
end
