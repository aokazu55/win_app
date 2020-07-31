class TradesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_service, only: [:create, :destroy, :update]
		def new
			@trade = Trade.new
		end

		def index
			@trades = Trade.all.
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

		def create
			@comment = @service.comments.build(comment_params)
			@comment.user_id = current_user.id
			respond_to do |format|
				if @comment.save
					format.js { render :index }
				else
					format.js { render :error }
				end
			end
		end

		def destroy
			@comment = Comment.find(params[:id])
			@comment.destroy
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
