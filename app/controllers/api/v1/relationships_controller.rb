class Api::V1::RelationshipsController < ApplicationController
    def index 
        # render json: Relationship.first, status: :ok
        relationships = Relationship.all
        render json: relationships, status: :ok
    end 

    def show
        relationship = Relationship.find(params[:id])
        render json: relationship, status: :ok
    end 

    # def create
    #     production = Production.create!(production_params)
    #     render json: production, status: :created
    # end 

    # def update 
    #     production = Production.find(params[:id])
    #     production.update!(production_params)
    #     render json: production, status: :accepted
    # end 

    # def destroy
    #     production = Production.find(params[:id])
    #     production.destroy
    #     head :no_content 
    # end 

    # private
    
    # def production_params
    #     params.permit(:title, :genre, :description, :budget, :image, :director, :ongoing)
    # end 
end
