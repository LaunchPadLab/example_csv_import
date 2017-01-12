Rails.application.routes.draw do
  resources :user_imports
  root to: 'user_imports#index'
end
