class Api::V1::MenteesController < ApplicationController
  before_action :set_mentee, only: %i[ show update destroy ]

  # GET /mentees
  def index
    @mentees = Mentee.all

    render json: @mentees
  end

  # GET /mentees/1
  def show
    render json: @mentee
  end

  # POST /mentees
  def create
    @mentee = Mentee.new(mentee_params)

    if @mentee.save
      render json: @mentee, status: :created, location: @mentee
    else
      render json: @mentee.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mentees/1
  def update
    if @mentee.update(mentee_params)
      render json: @mentee
    else
      render json: @mentee.errors, status: :unprocessable_entity
    end
  end

  # DELETE /mentees/1
  def destroy
    @mentee.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mentee
      @mentee = Mentee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mentee_params
      params.require(:mentee).permit(:name, :age, :email, :description, :phone_numer, :community_id, :password_digest)
    end
end
