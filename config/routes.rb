Rails.application.routes.draw do
  resources :dashboard, only: [:index]
  resources :tasks
  resources :projects
  devise_for :users
  root to: 'dashboard#index'
end
