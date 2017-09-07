class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    #dopilnuj ze baza jest dobrze skonfigurowana, nie jest bo nie ma id!
    #rails consol utwórz posty - done
    # render json - i by sie wyswietlyt

    @posts = Post.all
      # dodasz w linii ponizej uzycie serializera (najpierw go trzeba utworzyc),
      # ktory ograniczy wyswietlanie atrybutow posta

    render json: @posts
  end


  def create
    # zwracanie bledu jezeli post nie jest poprawny
    post = Post.create(post_params)
    if post.valid?
      render json: post
    else
      render json: post.errors.full_messages
    end
  end

  def show
    respond_with Post.find(params[:id])
  end

  def upvote
    post = Post.find(params[:id])
    post.increment!(:upvotes)
    render json: post
  end

  def default_serializer_options
    { root: false }
  end

  private

  def post_params
    params.require(:post).permit(:link, :title, :id)
  end
end
