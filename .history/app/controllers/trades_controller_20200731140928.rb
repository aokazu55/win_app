class TradesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_service, only: [:contract, :show, :create, :destroy, :update]

		def contract
		end

		def index
			@trades = Trade.all.order(id: "DESC")
		end

		def show
			@trade = Trade.find(params[:id])
		end

		def create
			trade = current_user.trades.create(service_id: params[:service_id])
			flash[:success] = "この商品を購入しました"
			redirect_to service_path(trade.service.id)
		end

		def destroy
			trade = current_user.trades.find_by(id: params[:id]).destroy
			flash[:danger] = "購入をキャンセルしました"
			redirect_to service_path(trade.service.id)
		end



	private

	def trade_params
		params.require(:trade).permit(:message, :service_id, :user_id)
	end

	def set_service
		@service = Service.find(params[:service_id])
	end

end
