Rails.application.routes.draw do
  devise_for :users

  root 'messages#index'
  resources :messages

  # Twilio API routes
  get 'history' => 'twilio#history'
  get 'call' => 'twilio#call'
  get 'twilio/process_sms' => 'twilio#process_sms'
  get 'twilio/call_handler' => 'twilio#call_handler'

end
