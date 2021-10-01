class Api::V1::UsersController < ApplicationController

    # GET /users
    def index
        @users = User.all
        render json: @users
    end

    # GET /uer/:id
    def show
        @user = User.find(params[:id])
        render json: @user
    end

    # POST /users
    def create
        @user = User.new(User_params)
        if @user.save
            render json: @user
        else
            render error: {error: 'Unable to create User.'}, status: 400
        end
    end

    # PUT /usres/:id
    def updated_at
        @user = User.find(params[:id])
        if @user
            @user.update(user_params)
            render json: {message: 'User successfully updates.'}, status: 200
        else
            render json: {error: 'Unable to update User.'}, status: 400
        end
    end

    # DELETE /user/:id
    def destroy
        @user = User.find(params[:id])
        if @user
            @user.destroy
            render json: {message: 'User successfully deleted.'}, status: 200
        else
            render json: {error: 'Unable to delete user.'}, status: 400
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
