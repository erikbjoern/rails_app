Rails.application.routes.draw do
  devise_for :admins
  get 'articles/index'
  root controller: :articles, action: :index
  resources :articles
  resources :admins
end
