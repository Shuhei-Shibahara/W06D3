class ArtworksController < ApplicationController

    def create

        @artwork = Artwork.new(artwork_params)
        if @artwork.save
            redirect_to artwork_url(@artwork), status: :created
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        Artwork.destroy_by(id: params[:id]) 
    end

    def index
        @artwork = Artwork.all
        render json: @artwork
    end

    def show
        @artwork = Artwork.find_by(id: params[:id])
        render json: @artwork
    end

    def update
        @artwork = Artwork.find_by(id: params[:id])
        
        if @artwork.update(artwork_params)
            redirect_to artwork_url(@artwork), status: :updated
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end





    private 

    def artwork_params 
        param.require(:artwork).permit(:title, :image_url, :artist_id)
    end 
end
