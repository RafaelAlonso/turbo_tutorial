class PostsController < ApplicationController

  def create
    @post = Post.new(post_params)

    # dependo do tipo de requisição que foi enviada,
    # responda de uma maneira diferente
    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path }
      else
        @posts = Post.all
        format.html { render 'pages/home' }
        format.turbo_stream do 
          render turbo_stream: turbo_stream.update('new_post', partial: "posts/form", locals: { post: @post })
        end
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
