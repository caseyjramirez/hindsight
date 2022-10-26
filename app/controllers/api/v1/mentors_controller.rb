class Api::V1::MentorsController < ApplicationController
  before_action :set_mentor, only: %i[ show update destroy ]

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
    @mentor = Mentor.new(mentor_params)

    if @mentor.save
      render json: @mentor, status: :created, location: @mentor
    else
      render json: @mentor.errors, status: :unprocessable_entity
    end
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
      params.require(:mentor).permit(:name, :age, :email, :description, :phone_numer, :community_id, :password_digest)
    end
end
