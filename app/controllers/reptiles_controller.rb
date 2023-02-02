class ReptilesController < ApplicationController

    def index
        reptiles = Reptile.all
        render json: reptiles
    end

    def create
        reptile = Reptile.create(reptile_params)
        if reptile.valid?
            render json: reptile
        else
            render json: reptile.errors, status: 422
        end
    end

    def update
        reptile = Reptile.find(params[:id])
        reptile.update(reptile_params)
        if reptile.valid?
            render json: reptile
        else
            render json: reptile.errors, status: 422
        end
    end

    def destroy
        reptile = Reptile.find(params[:id])
        reptile.destroy
        render json: Reptile.all
    end
    
    private
    def reptile_params
        params.require(:reptile).permit(:name, :age, :enjoys, :image)
    end

end
