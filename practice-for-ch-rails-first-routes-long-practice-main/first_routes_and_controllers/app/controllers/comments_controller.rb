class CommentsController < ApplicationController

    def create
        @comment = Comment.new(comment_params)

        if @comment.save
            redirect_to comment_url(@comment), status: :created
        else 
            render json: @comment.errors.full_messages, status: 422 
        end 
    end 
    
    def destroy
        Comment.destroy_by(id: params[:id])
    end

    def index 
        @comment = Comment.all
        render json: @comment
    end 

    private 
    
    def comment_params
        param.require(:comment).permit(:author_id, :body, :artwork_id)
    end 
end
