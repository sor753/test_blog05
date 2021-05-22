class Admin::PostBlogsController < Admin::Base
  before_action :current_admin_check

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    blog = Blog.new(blog_params)
    if blog.save
      flash.notice = "「#{blog.title}」を投稿しました。"
      redirect_to :admin_post_blogs
    else
      flash.alert = "投稿に失敗しました。"
      render action: "new"
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.assign_attributes(blog_params)
    if @blog.save
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
