class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: [:create, :upvote,:destroy]

  def index
    render json: Post.all
  end

  def create
    post = Post.create(post_params.merge(user_id: current_user.id))
    if post.valid?
      render json: post
    else
      render json: post.errors.full_messages
    end
  end

  def show
    find_post and return
    render json: @post
  end

  def destroy
    find_post and return
    @post.destroy
    render json: @post
  end

  def upvote
    find_post and return
    vote = @post.votes.create(user_id: current_user.id)
    if vote.valid?
      render json: @post
    else
      render json: { errors: vote.errors }
    end
    # TODO: usunac kolumne upvotes, gdyz upvotes = @post.votes.count
  end

  def downvote
    # TODO: zmodyfikować analogicznie do powyższych (find_post, wyrzucić decrement = @post.votes.destroy(...))
 #   post = Post.find(params[:id])
 #   post.decrement!(:upvotes)
    render json: post
  end

  def default_serializer_options
    { root: false }
  end

  private

  def post_params
    params.require(:post).permit(:link, :title, :id, :text, :upvotes)
  end

  def find_post
    @post = Post.find_by_id(params[:id])
    unless @post
      render(json: { message: 'record not found' }, status: :not_found)
      return true
    end
  end
end

 #dopilnuj ze baza jest dobrze skonfigurowana
 #rails consol utwórz posty - done
 # render json - i by sie wyswietlyt

  ###
  #dodasz w linii ponizej uzycie serializera (najpierw go trzeba utworzyc),
  # ktory ograniczy wyswietlanie atrybutow posta
