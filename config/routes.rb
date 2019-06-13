Rails.application.routes.draw do
  namespace :api do
    get 'search/index'
  end
  resources :delivery_places do
    resources :menus
  end
  resources :menus, only: [] do
    resources :dishes
  end
  get 'search', to: 'search#'
  namespace :api do
    get 'search', to: 'search#index'
  end
  root 'delivery_places#index'
end
