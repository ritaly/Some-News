class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :upvote]
  def create
    post = Post.find(params[:post_id])
    #params ={body: "Hi, hurra up!", upvotes: 2, created_at: Time.zone.now.beginning_of_day}
    # post.comments.create(params.merge(user_id: current_user.id))
    comment = post.comments.create(params[:comment].merge(user_id: current_user.id).permit!)

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
  def downvote
    post = Post.find(params[:post_id])
    comment = post.comments.find(params[:id])
    comment.decrement!(:upvotes)
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
