class BlogController < ApplicationController
  def index
    @blogs = Blog.all
    @blogs = @blogs.page(params[:page])
  end

  def show
    @blog = Blog.find(params[:id])
    @blog_marks = @blog.marks
  end

  def category
    @blogs = Blog.category(params[:keyword])
    @blogs = @blogs.page(params[:page])
    @keyword = params[:keyword]
    render "index"
  end

  def tags
    @mark = Mark.find(params[:mark_id])
    @blogs = @mark.blogs.all
    @blogs = @blogs.page(params[:page])
    render "index"
  end

  def tag_search
    @mark = Mark.find_by(mark_name: params[:mark_name])
    if @mark.present?
      @blogs = @mark.blogs.all
      @blogs = @blogs.page(params[:page])
    else
      flash.alert = "「#{params[:mark_name]}」タグはありませんでした。"
      redirect_to :root
    end
  end
end
