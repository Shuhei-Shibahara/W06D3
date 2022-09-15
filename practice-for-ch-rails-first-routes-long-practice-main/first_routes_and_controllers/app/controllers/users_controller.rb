class UsersController < ApplicationController

    def create
        @user = User.new(user_params) 

        if @user.save
            redirect_to user_url(@user), status: :created
        else
            render json: @user.errors.full_messages,status: :unprocessable_entity
        end
    end

    def destroy
        User.destroy_by(id: params[:id]) render json: ['User Deleted']
    end

    def index
        @user = User.all
        render json: @user
    end 

    def show 
        @user = User.find_by(id: params[:id])
        render json: @user
    end 
    
    def update
        @user = User.find_by(id: params[:id])

        if @user.update(user_params)
            redirect_to user_url(@user)
        else 
            render json: @user.errors.full_messages, status: :422
        end 
    end 

    private
    def user_params
        params.require(:user).permit(:username)
    end
end
