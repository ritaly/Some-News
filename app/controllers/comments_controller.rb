class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :upvote, :destroy]
  # TODO: make upvoting work as in posts

  def create
    # TODO:  what if post is not found? prevent from having a 500
    post = Post.find(params[:post_id])
    # TODO: use strong parameters when creating comment
    # TODO: remove username colum from comments
    comment = post.comments.create(params[:comment].merge(user_id: current_user.id).permit!)
    #params.required - strong parametes!
    if comment.valid?
      render json: comment
    else
      render json: comment.errors.full_messages
    end
  end

  def upvote
    # TODO:  what if comment is not found? prevent from having a 500
    comment = Comments.find(params[:id])
    comment.increment!(:upvotes)
    render json: comment
  end
  def downvote
       # TODO:  what if comment is not found? prevent from having a 500
    post = Post.find(params[:post_id])
    comment = post.comments.find(params[:id])
    comment.decrement!(:upvotes)
    render json: comment
  end

  def destroy
       # TODO:  what if comment is not found? prevent from having a 500

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
