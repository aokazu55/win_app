class ServicesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_service, only: [:show, :edit, :update, :destroy]

    def show
      # @comment = Comment.new
      # @comments = @service.comments.order(created_at: :desc)
      @comment = @service.comments.build
      @comments = @service.comments

    end

    def index
      @services = Service.all
    end

    def new
      @service = Service.new
    end

    def create
      @service = current_user.services.build(service_params)
      if @service.save
        redirect_to service_path(@service), notice: "サービスを投稿しました"
      else
        render :new
      end
    end

    def edit
      if @service.user != current_user
        redirect_to services_path, alert: "不正なアクセスです"
      end
    end

    def update
      if @service.update(service_params)
        redirect_to service_path(@service), notice: "サービスを更新しました"
      else
        render :edit, alert: "更新できませんでした"
      end
    end

    def destroy
      service = Service.find(params[:id])
      service.destroy
      redirect_to user_path(service.user), notice: "サービスを削除しました。"
    end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:service_name, :main_service, :service_detail, :price, :remark, :image, :working_time, :confidence_level, :period_start, :period_end, :transportation_expenses)
  end
end
