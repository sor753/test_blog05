class Admin::Base < ApplicationController
  layout "admin"

  private
  def current_admin
    if session[:administrator_id]
      @current_admin ||=
        Administrator.find_by(id: session[:administrator_id])
    end
  end

  helper_method :current_admin
end