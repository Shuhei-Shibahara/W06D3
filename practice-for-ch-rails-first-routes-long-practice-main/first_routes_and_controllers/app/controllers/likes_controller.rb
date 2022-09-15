class LikesController < ApplicationController
    def create
        @like = Like.new(like_params)
        if @like.save
            render json: ["#{:likeable_type} liked"]
        else
            render json: @like.errors.full_messages, status: 422
        end
    end

    private

    def like_params
        params.require(:like).permit(:likeable_id, :liker_id)
    end
end
