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
			@trade = @service.trades.build(trade_params)
			@trade.user_id = current_user.id
			respond_to do |format|
				if @trade.save
					format.js { render :index }
				else
					format.js { render :error }
				end
			end
		end

		def destroy
			@trade = trade.find(params[:id])
			@trade.destroy
			respond_to do |format|
				format.js { render :index }
			end
		end

	private

	def trade_params
		params.require(:trade).permit(:message, :service_id, :user_id)
	end

	def set_service
		@service = Service.find(params[:service_id])
	end

end
