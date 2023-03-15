


class PlantsController < ApplicationController
    wrap_parameters format: []
    def index
        render json: Plant.all, status: :ok
    end

    def show
        plant = Plant.find_by(id:params[:id])
        if plant
            render json: plant, status: :ok
        else
            render json: { error: "Plant not found" }, status: :not_found
        end 
    end


    def create
        render json: Plant.create(plant_params(params)), status: 201
    end

    private
    def plant_params(params)
        params.permit(:name, :image, :price)
    end
  end
  
