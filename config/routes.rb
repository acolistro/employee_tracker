Rails.application.routes.draw do
  root to: 'divisions#index'
  resources :divisions do
    resources :employees
  end  
  resources :projects

  end
