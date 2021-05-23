class BlogController < ApplicationController
  def index
    @blogs = Blog.all
    @blogs = @blogs.page(params[:page])
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def category
    @blogs = Blog.category(params[:keyword])
    @blogs = @blogs.page(params[:page])
    @keyword = params[:keyword]
    render "index"
  end
end
