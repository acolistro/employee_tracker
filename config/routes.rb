Rails.application.routes.draw do
  root to: 'divisions#index'
  resources :division do
    resources :employees do
      resources :projects do

      end
    end
  end
end
