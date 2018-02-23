Rails.application.routes.draw do
  namespace :admin do
    resources :beers

    root to: "beers#index"
  end
end
