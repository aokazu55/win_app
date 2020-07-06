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
end
