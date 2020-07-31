

class TradesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_trade, only: [:show, :destroy]

  def index
    @trades = trade.all
  end

  def new
    @trade = trade.new
  end

  def create
    @trade = trade.new(trade_params.merge(service_id: service.id))
    if @trade.save
      redirect_to trade_path(@trade), notice: "購入を完了しました"
    else
      render :new, alert: "購入に失敗しました。。。"
    end
  end

  def show
  end

  def destroy
    @trade.destroy
    redirect_to servicer_path(trade.service), notice: "購入をキャンセルしました。"
  end

  private

  def set_trade
    @trade = trade.find(params[:id])
  end

  def trade_params
    params.require(:trade).permit(:message, :service_id, :user_id)
  end

end