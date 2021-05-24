class Admin::PostBlogsController < Admin::Base
  before_action :current_admin_check

  def index
    @mark_list = Mark.all
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    blog = Blog.new(blog_params)
    mark_list = params[:blog][:mark_name].split(nil) 
    if blog.save
      blog.save_mark(mark_list) 
      flash.notice = "「#{blog.title}」を投稿しました。"
      redirect_to :admin_post_blogs
    else
      flash.alert = "投稿に失敗しました。"
      render action: "new"
    end
  end

  def show
    @blog = Blog.find(params[:id])
    @blog_marks = @blog.marks
  end

  def edit
    @blog = Blog.find(params[:id])
    @blog_marks = @blog.marks.pluck(:mark_name).join(" ")
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.assign_attributes(blog_params)
    @mark_list = params[:blog][:mark_name].split(nil) 
    if @blog.save
      @blog.save_mark(@mark_list)
      flash.notice = "更新しました。"
      redirect_to :admin_post_blogs
    else
      render action: "edit"
    end
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy!
    flash.notice = "「#{blog.title}」を削除しました。"
    redirect_to :admin_post_blogs
  end

  def tags
    @mark_list = Mark.all
    @mark = Mark.find(params[:mark_id])
    @blogs = @mark.blogs.all
    render "index"
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :author, :image, :content, :thumb)
  end
  def current_admin_check
    unless current_admin
      redirect_to :admin_root
    end
  end
end
