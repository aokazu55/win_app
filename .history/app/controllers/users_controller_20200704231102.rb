class UsersController < ApplicationController
  before_aciton :set_user, only[:show, :edit, :update, :destroy]
  def index
  end

  def show
  end

  def edit
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    require(:user).permit(:name, :email, :password)
end
