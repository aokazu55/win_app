class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

	# def trade_by?
	# 	trades.where(user_id: user.id).exists?
	# end
  
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
