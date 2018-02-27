Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"  }

  # Resources
  resources :users

  root to: "home#index"

  namespace :admin do
    resources :users
    resources :roles
    # get '/roles', to: 'roles#index'
    # get '/roles/:id', to: 'roles#show'
    resources :identities
    resources :beers

    root to: "users#index"
  end
end
