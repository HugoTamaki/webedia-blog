Rails.application.routes.draw do
  devise_for :user

  devise_scope :user do
    get 'admin/login', to: 'devise/sessions#new'
  end

  root to: "home#index"

  namespace :admin do
    resources :posts
  end
end
