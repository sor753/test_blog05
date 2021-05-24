Rails.application.routes.draw do
  namespace :admin do
    root "top#index"
    get "login" => "sessions#new", as: :login
    post "session" => "sessions#create", as: :session
    delete "session" => "sessions#destroy"

    resources :post_blogs

    get "tags", to: "post_blogs#tags"
  end

  root "blog#index"
  resources :blog, only: %i[show]
  get "category" => "blog#category"
  get "tags"=> "blog#tags"
  get "tag_search" => "blog#tag_search"
end
