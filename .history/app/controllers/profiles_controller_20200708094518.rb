class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
  end

  # def create
  #   @profile = current_user.profiles.build(profile_params)
  #   if @profile.save
  #     redirect_to profile_path(@profile), notice: "プロフィールを投稿しました。"
  #   else
  #     render :new, alert: "プロフィール投稿に失敗しました。。。"
  #   end
  # end

  def create
    # session[:nickname] = profile_params[:nickname]
    # session[:date_of_birth] = profile_params[:date_of_birth]
    # # session[:gender_id] = profile_params[:gender_id]
    # # session[:address_id] = profile_params[:address_id]
    # # session[:personality_id] = profile_params[:personality_id]
    # # session[:special_skill_id] = profile_params[:special_skill_id]
    # session[:introduce] = profile_params[:introduce]

    # # @profile = Profile.new(
    # #   nickname: profile_params[:nickname],
    # #   # date_of_birth: profile_params[:date_of_birth],
    # #   # gender_id: profile_params[:gender_id],
    # #   # address_id: profile_params[:address_id],
    # #   # personality_id: profile_params[:personality_id],
    # #   # special_skill_id: profile_params[:special_skill_id],
    # #   introduce: profile_params[:introduce]
    # # )

    @profile = Profile.new(profile_params)
    if @profile.build_user.save
      redirect_to @profile, notice: "プロフィールが登録できました"
    else
      render :new, danger: "プロフィール登録に失敗しました"
    end
  end

      #   @service = current_user.services.build(service_params)
      # if @service.save
      #   redirect_to service_path(@service), notice: "サービスを投稿しました"
      # else
      #   render :new
      # end


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