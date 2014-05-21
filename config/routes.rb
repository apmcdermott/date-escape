Rails.application.routes.draw do
  devise_for :users

  root 'scenarios#index'
  resources :scenarios
  resources :messages

  # Twilio API routes
  get 'history' => 'twilio#history'
  get 'call' => 'twilio#call'
  get 'process_sms' => 'twilio#process_sms'
  get 'call_handler' => 'twilio#call_handler'

end
