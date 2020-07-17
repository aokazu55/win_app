class CommentsController < ApplicationController
  before_action :set_service, only: [:create, :destroy]

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

  def comment_params
    params.require(:comment).permit(:content, :service_id, :user_id)
  end

  def set_service
    @service = Service.find(params[:service_id])
  end
end
