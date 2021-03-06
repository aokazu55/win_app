class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_aciton :set_user, only: [:show, :edit, :update, :destroy]
  
    def index
      @users = User.all
    end

    def show
    end

    def edit

    end

    def update
      @user.update(user_params)
      redirect_to user_path(@user)
    end

    def destroy
    end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end
end
