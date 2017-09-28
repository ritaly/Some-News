class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create upvote downvote destroy]
  # TODO: make upvoting work as in posts

  def create
    post = Post.find_by_id(params[:post_id])
    if post
      comment = post.comments.create(comment_params.merge(user_id: current_user.id).permit!)
    else
      render(json: { message: 'record not found' }, status: :not_found)
    end

    if comment.valid?
      render json: comment
    else
      render json: comment.errors.full_messages
    end
    # TODO:  what if post is not found? prevent from having a 500
    # TODO: use strong parameters when creating comment
    # TODO: remove username colum from comments
    # params.required - strong parametes!
  end

  def upvote
    find_comment and return
    vote = @comment.comment_votes.create(user_id: current_user.id)
    if vote.valid?
      render json: @comment
    else
      render json: { errors: vote.errors }
    end
    # TODO:  what if comment is not found? prevent from having a 500
  end

  def downvote
    find_comment and return
    vote = @comment.comment_votes.find_by(user_id: current_user.id).destroy
    if vote.valid?
      render json: @comment
    else
      render json: { errors: vote.errors }
    end
  end

  def destroy
    find_comment && return
    @comment.destroy
    render json: @comment
  end

  private

  def comment_params
    params.require(:comment).permit(:id, :body, :user)
  end

  def find_comment
    @comment = Comment.find_by_id(params[:id])
    unless @comment
      render(json: { message: 'record not found' }, status: :not_found)
      return true
    end
  end
end
