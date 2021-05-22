class BlogController < ApplicationController
  def index
    @blogs = Blog.all
    @blogs = @blogs.page(params[:page])
  end

  def show
    @blog = Blog.find(params[:id])
  end
end
