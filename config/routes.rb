Rails.application.routes.draw do
  devise_for :users
  root 'scenarios#index'
  resources :scenarios
  resources :messages
end
