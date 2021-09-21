class PostsController < ApplicationController

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to root_path
    else
      @posts = Post.all
      render 'pages/home'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
