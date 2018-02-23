Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"  }

  # Resources
  resources :users

  root to: "home#index"
end
