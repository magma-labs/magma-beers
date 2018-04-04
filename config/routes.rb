# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # Root path
  root to: 'home#index', as: :user_root

  # Resources
  resources :users
  resources :beers
  resources :beer_logs
  get 'contact-us', to: 'contact#new', as: 'new_contact'
  post 'contact-us', to: 'contact#create', as: 'create_contact'

  # Mailer reminder
  mount Sidekiq::Web => '/sidekiq'
  mount LetterOpenerWeb::Engine, at: '/emails' if Rails.env.development?

  # Administrate routes
  namespace :admin do
    # Administrate root path
    root to: 'users#index'

    # Administrate resources
    resources :users
    resources :roles
    resources :identities
    resources :beers

    # Sync beers catalog action
    get '/sync_beers', to: 'beers#sync_catalog', as: :sync_beers
  end

  # Api
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      get '/beers', to: 'beers#index'
      resources :beer_logs
    end
  end

  # Handler errors
  match '*path', to: 'home#catch_404', via: :all
end
