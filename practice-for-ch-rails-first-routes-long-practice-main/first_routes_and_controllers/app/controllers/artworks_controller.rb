class ArtworksController < ApplicationController






    private 

    def artwork_params 
        param.require(:artwork).permit(:)
    end 
end
