class Api::V1::MenteesController < ApplicationController
  before_action :set_mentee, only: %i[ show update destroy ]
  skip_before_action :authorized_user, only: [:create]

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
    mentee = Mentee.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      community_id: Community.first.id,
      password: params[:password],
    )
    
    session[:user_id] = mentee.id
    render json: mentee, status: :created
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
      params.require(:mentee).permit(:first_name, :last_name, :age, :email, :phone_number, :description, :community_id, :password_digest)
    end
end
