module Api::V1
  class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def new
    	@user = User.new
      render json: @user
    end

    def create
    	user = User.new(user_params)
      if user.save
      	render json: { message: "User is successfully Created" }
      else
      	render json: { message: user.errors, status: :unprocessable_entity }
      end
    end

    def update
      user = User.find_by_id(params[:id])
      if user.present?
        if user.update_attributes(user_params)
          render json: { message: "User is successfully Updated" }
        else
          render json: { message: user.errors, status: :unprocessable_entity }
        end
      else
        render json: { message: "User not found" }
      end
    end

    def destroy
      user = User.find_by_id(params[:id])
      if user.present?
        if user.destroy
          render json: { message: "User is successfully Deleted" }
        else
          render json: { message: "User can not delete" }
        end
      else
        render json: { message: "User not found" }
      end
    end

    def index
    	users = User.all
    	render json: users
    end

    def show
    	user = User.find_by_id(params[:id])
      if user.present?
    	 render json: user
      else
        render json: { message: "User not found" }
      end
    end

    def edit
      user = User.find_by_id(params[:id])
      if user.present?
       render json: user
      else
        render json: { message: "User not found" }
      end
    end

    private
    def user_params
    	params.require(:user).permit(:name, :age, :email)
    end
  end
end