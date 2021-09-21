class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @posts = Post.all
    @post = Post.new
  end

  def contact
  end
end
