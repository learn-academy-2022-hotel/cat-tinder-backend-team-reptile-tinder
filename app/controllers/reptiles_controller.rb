class ReptilesController < ApplicationController

    def index
        reptiles = Reptile.all
        render json: reptiles
    end

    def create
        reptile = Reptile.create(reptile_params)
        render json: reptile
    end

    def update
        reptile = Reptile.find(params[:id])
        reptile.update(reptile_params)
        render json: reptile
    end

    def destroy
    end
    
    private
    def reptile_params
        params.require(:reptile).permit(:name, :age, :enjoys, :image)
    end

end
