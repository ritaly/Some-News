class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: [:create, :upvote]

  def index
    @posts = Post.all
    render json: @posts
  end

  def create
    # zwracanie bledu jezeli post nie jest poprawny
    post = Post.create(post_params.merge(user_id: current_user.id))
    if post.valid?
      render json: post
    else
      render json: post.errors.full_messages
    end
  end

  def show
    post = Post.find(params[:id])
    #comment = post.comments
    render json: post
  end

  def upvote
    post = Post.find(params[:id])
    post.increment!(:upvotes)
    render json: post
  end
  def downvote
    post = Post.find(params[:id])
    post.decrement!(:upvotes)
    render json: post
  end

  def default_serializer_options
    { root: false }
  end

  private

  def post_params
    params.require(:post).permit(:link, :title, :id, :text, :upvotes)
  end
end

 #dopilnuj ze baza jest dobrze skonfigurowana
 #rails consol utwórz posty - done
 # render json - i by sie wyswietlyt

  ###
  #dodasz w linii ponizej uzycie serializera (najpierw go trzeba utworzyc),
  # ktory ograniczy wyswietlanie atrybutow posta
