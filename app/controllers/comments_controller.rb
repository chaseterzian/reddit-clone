class CommentsController < ApplicationController
  before_action do
    @post = Post.find(params[:post_id])
  end
  before_action :authenticate_user

  def create
    @comment = @post.comments.new(comment_params)
    @comment.update_attributes(user_id: current_user.id)
    @comment.save
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
