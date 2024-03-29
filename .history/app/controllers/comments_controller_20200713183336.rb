class CommentsController < ApplicationController
  before_action :set_service, only: [:create, :edit, :update, :destroy]
    PER = 6

  def create
    @comment = @service.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        flash.now[:notice] = 'コメントが投稿されました'
        format.js { render :index }
      else
        flash.now[:notice] = 'コメントの投稿に失敗しました'
        format.js { render :error }
      end
    end
  end

  def edit
    @comment = @service.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def update
    @comment = @service.comments.find(params[:id])
      respond_to do |format|
        if @comment.update(comment_params)
          flash.now[:notice] = 'コメントが編集されました'
          format.js { render :index }
        else
          flash.now[:notice] = 'コメントの編集に失敗しました'
          format.js { render :edit_error }
        end
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
      @comment.destroy
      respond_to do |format|
        flash.now[:notice] = 'コメントが削除されました'
        format.js { render :index }
      end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :service_id)
  end

  def set_service
    @service = Service.find(params[:service_id])
  end
end
