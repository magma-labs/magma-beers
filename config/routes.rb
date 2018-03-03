Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :sessions => "users/sessions" }

  # Resources
  resources :users

  root to: "home#index", as: :user_root

  namespace :admin do
    resources :users
    resources :roles
    resources :identities
    resources :beers

    root to: "users#index"
  end
end
