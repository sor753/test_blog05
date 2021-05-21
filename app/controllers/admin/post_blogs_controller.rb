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

  private

  def blog_params
    params.require(:blog).permit(:title, :author, :image)
  end
  def current_admin_check
    unless current_admin
      redirect_to :admin_root
    end
  end
end
