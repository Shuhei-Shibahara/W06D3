class LikesController < ApplicationController
    def create
        debugger
        @like = Like.new(like_params)
        if @like.save
            render json: ["#{:likeable_type} liked"]
        else
            render json: @like.errors.full_messages, status: 422
        end
    end

    def delete
        Like.destroy_by(id: params[:id])
    end 
    

    private

    def like_params
        params.require(:like).permit(:likeable_id, :liker_id, :likeable_type)
    end
end
