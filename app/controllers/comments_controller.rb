class CommentsController < ApplicationController
  before_action do
    @post = Post.find(params[:post_id])
  end
  before_action :set_comment, except: [:create]
  before_action :authenticate_user
  before_action :comment_owner, except: [:create]

  def create
    @comment = @post.comments.new(comment_params)
    @comment.update_attributes(user_id: current_user.id)
    @comment.save
    redirect_to post_path(@post)
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end
end
