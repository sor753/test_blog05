Rails.application.routes.draw do
  namespace :admin do
    root "top#index"
    get "login" => "sessions#new", as: :login
    post "session" => "sessions#create", as: :session
    delete "session" => "sessions#destroy"

    resources :post_blogs
  end

  root "blog#index"
  resources :blog, only: %i[show]
  get "category" => "blog#category"
end

