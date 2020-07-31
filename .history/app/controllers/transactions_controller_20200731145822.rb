class TransactionsController < ApplicationController
  require 'payjp'
  before_action :set_card, only: [:pay_index, :pay]
  before_action :set_service

  def pay_index
    @top_image = @service.images.first
    @card = @set_card.first
    if @card.blank?
      redirect_to controller: "cards", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    @card = @set_card.first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => @service.price,
    :customer => @card.customer_id,
    :currency => 'jpy',
  )
  redirect_to action: 'done', service_id: @service
  end

  def done
    @top_image = @service.images.first
    Transaction.create(service_id: @service.id, user_id: current_user.id)
  end

  private

  def set_card
    @set_card = Card.where(user_id: current_user.id)
  end

  def set_service
    @service = service.find(params[:service_id])
  end

end