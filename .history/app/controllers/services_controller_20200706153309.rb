class ServicesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_service, only: [:show, :edit, :update, :destroy]

    def show
    end

    def index
    end

    def new
      @service = Service.new
    end

    def edit
    end


  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:service_name, :main_service, :service_detail, :price, :remark, :image, :working_time, :confidence_level, :period_start, :period_end, :transportation_expenses)
  end
end
