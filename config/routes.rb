Rails.application.routes.draw do
  devise_for :users

  root 'scenarios#index'
  resources :scenarios
  resources :messages

  # Twilio API routes
  get 'call' => 'twilio#call'
  get 'sms' => 'twilio#sms'
  get 'call_handler' => 'twilio#call_handler'

end
