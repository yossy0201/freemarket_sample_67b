class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = Comment.new(comment_params)
    @good = Good.find(params[:good_id])
    if comment.save
      redirect_to good_path(@good.id)
    else
      @comment = Comment.new
      @comments = @good.comments.includes(:user)
      render "goods/show"
    end
  end
  
  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, good_id: params[:good_id])
  end

end
