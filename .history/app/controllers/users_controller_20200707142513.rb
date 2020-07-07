class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_user, only: [:show, :edit, :update]
  
    def index
      @users = User.all
    end

    def show
    end

    def edit
      if @user != current_user
        redirect_to users_path, alert: "不正なアクセスです"
      end
    end

    def update
      @user.update(user_params)
      redirect_to user_path(@user)
    end

    def destroy
      user = User.find(params[:id])
      user.destroy
      redirect_to root_path, notice: "ありがとうございました。またのご利用を心よりお待ちしております。"
    end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end
end
