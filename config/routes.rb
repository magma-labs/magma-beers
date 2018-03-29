require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
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

  get 'contact-us', to: 'contact#new', as: 'new_contact'
  post 'contact-us', to: 'contact#create', as: 'create_contact'


  # Handler errors
  match "*path", to: "home#catch_404", via: :all
end
