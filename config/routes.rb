Rails.application.routes.draw do

  # Allows for additional fields in Devise
  devise_for :users, :controllers => { registrations: 'registrations' }

  # Authenticated users to go their dashboard
  authenticated do
    root :to => 'home#dashboard', as: :authenticated
  end

  # Non-authenticated users to go static homepage
  root :to => 'home#index'

  resources :home, only: [:index]
  get 'howitworks' => 'home#howitworks'

  resources :messages

  # Twilio API routes
  get 'history' => 'twilio#history'
  get 'twilio/process_sms' => 'twilio#process_sms'
  get 'twilio/call_handler' => 'twilio#call_handler'

end
