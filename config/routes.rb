require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions'
  }

  # Resources
  resources :users
  resources :beers
  resources :beer_logs

  root to: "home#index", as: :user_root
  mount Sidekiq::Web => '/sidekiq'
  mount LetterOpenerWeb::Engine, at: "/emails" if Rails.env.development?

  namespace :admin do
    resources :users
    resources :roles
    resources :identities
    resources :beers

    root to: 'users#index'
  end
end
