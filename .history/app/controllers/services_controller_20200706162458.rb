class ServicesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_service, only: [:show, :edit, :update, :destroy]

    def show
    end

    def index
      @services = Service.all
    end

    def new
      @service = Service.new
    end

    def create
      @service.user_id = current_user.id
      @serice = Service.new(service_params)
      @service.save
      redirect_to service_path(@service)
    end

    def edit
    end

    def update
      @service.update(service_params)
      redirect_to service_path(@service)
    end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:service_name, :main_service, :service_detail, :price, :remark, :image, :working_time, :confidence_level, :period_start, :period_end, :transportation_expenses)
  end
end
