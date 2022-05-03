class CampersController < ApplicationController

    def index 
        render json: Camper.all
    end

    def show
        render json: Camper.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        render json: {"error": "Camper not found"}, status: 404
    end

    def create
        camper = Camper.create(name: params[:name], age: params[:age])
        render json: camper
    rescue NoMethodError
        render json: {errors: 'validation errors'}, status: :unprocessable_entity
    end
end
