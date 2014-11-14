Rails.application.routes.draw do
  get 'payments/index'

  get 'payments/new'

  get 'payments/create'

  get 'payments/show'

  get 'payments/edit'

  get 'payments/update'

  get 'payments/destroy'

  devise_for :users

  root to: 'dashboard#index'
  resources :users
  resources :clients do
    resources :payments
  end
end
