class TradesController < ApplicationController
	def new
		@trade = Trade.new
	end

	def create
		trade = current_user.trades.create(service_id: params[:service_id])
		flash[:success] = "この購入しました"
		redirect_to service_path(trade.service.id)
	end

	def destroy
		trade = current_user.trades.find_by(id: params[:id]).destroy
		flash[:danger] = "購入をキャンセルしました"
		redirect_to service_path(trade.service.id)
	end

end
