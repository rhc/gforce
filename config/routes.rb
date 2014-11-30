Rails.application.routes.draw do
  resources :attendances

  resources :training_sessions do
    resources :attendances
  end

  resources :tariffs
  devise_for :users

  root to: 'dashboard#index'
  resources :users
  resources :clients do
    resources :payments
  end
end
