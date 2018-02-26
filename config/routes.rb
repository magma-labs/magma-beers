Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"  }

  # Resources
  resources :users

  root to: "home#index"

  namespace :admin do
    resources :beers

    root to: "beers#index"
  end
end
