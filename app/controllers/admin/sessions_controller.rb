class Admin::SessionsController < Admin::Base
  def new
    if current_admin
      redirect_to :admin_root
    else
      @form = Admin::LoginForm.new
      render action: "new"
    end
  end

  def create
    @form = Admin::LoginForm.new(login_form_params)
    if @form.name.present?
      administrator =
        Administrator.find_by(name: @form.name)
    end
    if Admin::Authenticator.new(administrator).authenticate(@form.password)
      session[:administrator_id] = administrator.id
      flash.notice = "ログインしました。"
      redirect_to :admin_root
    else
      flash.alert = "ユーザー名またはパスワードが正しくありません。"
      render action: "new"
    end
  end

  def destroy
    session.delete(:administrator_id)
    flash.notice = "ログアウトしました。"
    redirect_to :admin_root
  end

  private
  def login_form_params
    params.require(:admin_login_form).permit(:name, :password)
  end
end
