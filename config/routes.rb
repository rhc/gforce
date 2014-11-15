Rails.application.routes.draw do
  resources :tariffs
  devise_for :users

  root to: 'dashboard#index'
  resources :users
  resources :clients do
    resources :payments
  end
end
