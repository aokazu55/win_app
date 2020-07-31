class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params.merge(user_id: current_user.id))
    if @profile.save
      redirect_to profile_path(@profile), notice: "プロフィールを投稿しました。"
    else
      render :new, alert: "プロフィール投稿に失敗しました。。。"
    end
  end

  def show
  end

  def edit
    if @profile.user != current_user
        redirect_to profiles_path, alert: "他ユーザーの情報は変更出来ません。"
    end
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path(@profile), notice: "プロフィールを更新しました。"
    else
      render :edit, notice: "プロフィールの更新に失敗しました。"
    end
  end

  def destroy
    @profile.destroy
    redirect_to user_path(profile.user), notice: "プロフィールの削除しました。"
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:nickname, :date_of_birth, :gender_id, :address_id, :personality_id, :special_skill_id, :introduce)
  end

end