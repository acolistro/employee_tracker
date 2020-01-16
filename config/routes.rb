Rails.application.routes.draw do
  root to: 'divisions#index'
  resources :divisions
  resources :employees
  resources :projects
  end
