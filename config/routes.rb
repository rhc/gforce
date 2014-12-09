Rails.application.routes.draw do


  resources :measures

  resources :supersets
  resources :workouts
  resources :units
  resources :exercises

  resources :attendances do
    resources :performances
    resources :measurements
  end

  resources :training_sessions do
    resources :attendances  do
      resources :performances
    end
    resources :planned_workouts
  end
  resources :planned_workouts
  resources :performances

  resources :tariffs
  devise_for :users

  root to: 'dashboard#index'
  resources :users

  resources :clients do
    resources :payments
  end
  resources :measurements
end
