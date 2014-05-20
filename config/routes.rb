Rails.application.routes.draw do
  devise_for :users

  root 'scenarios#index'
  resources :scenarios
  resources :messages

  # Twilio API route
  post 'twilio/voice' => 'twilio#voice'
end
