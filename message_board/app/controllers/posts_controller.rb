class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params.merge(user: current_user))
    if @post.save
      flash[:success] = "Your post has been created"
      redirect_to @post
    else
      flash[:warning] = "There is a problem"
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
