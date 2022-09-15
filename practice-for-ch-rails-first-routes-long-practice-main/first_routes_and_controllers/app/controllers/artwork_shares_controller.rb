class ArtworkSharesController < ApplicationController
    def create
        @share = ArtworkShare.new(artwork_share_params)
        
        if @share.save
            render json: ['Artwork Shared']
        else
            render json: @share.errors.full_messages, status: 422
        end
    end

    private

    def destroy

        ArtworkShare.destroy_by(id: params[:id])
    end

    def artwork_share_params
        params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    end
end
