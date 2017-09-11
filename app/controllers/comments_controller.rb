class CommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.create(params[:comment].permit!)
    #params.required - strong parametes!
    if comment.valid?
      render json: comment
    else
      render json: post.errors.full_messages
    end
  end

  def upvote
    post = Post.find(params[:post_id])
    comment = post.comments.find(params[:id])
    comment.increment!(:upvotes)
    render json: comment
  end

  def destroy
    post = Post.find(params[:post_id])
    comment = post.comments.find(params[:id])
    comment.destroy
    render json: post
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
