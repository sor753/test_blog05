class Admin::LoginForm
  include ActiveModel::Model

  attr_accessor :name, :password
end