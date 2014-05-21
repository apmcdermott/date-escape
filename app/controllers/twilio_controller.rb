class TwilioController < ApplicationController
  include Webhookable

  # Disable CSRF detection to provide a POST endpoint to Twilio
  skip_before_action :verify_authenticity_token

  # Instantiate new client
  before_action :set_client

  # Instantiate From numer
  before_action :set_twilio_number

  # Set content type to xml for TwiML responses
  after_filter :set_header, only: [:call, :call_handler, :sms]

  def history
    # View list of all SMS messages from user
    if user_signed_in?
      @message_data = @client.account.messages.list({ from: current_user.phone })
    else
      redirect_to new_user_session_path
    end
  end

  def process_sms
    @from = User.where(phone: params["From"]).first
    # @call_message = @from.messages.where(trigger: params["Body"]).first
    call = @client.account.calls.create({
        :to => @from.phone, # To escapee's number
        :from => @app_number, # From app's Twilio number
        # Fetch instructions from this URL when the call connects
        :url => call_handler_url,
        :method => 'GET',
        :fallback_method => 'GET',
        :status_callback_method => 'GET',
        :record => 'false'
      })

    render_twiml call
  end

  def call_handler
    @from = User.where(phone: params["From"]).first
    @call_message = @from.messages.where(trigger: params["Body"]).first
    response = Twilio::TwiML::Response.new do |r|
      r.Say "#{@call_message[:content]}", :voice => "#{@call_message[:voice]}"
    end

    render_twiml response
  end

  private

  def set_client
    @client = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end

  def set_twilio_number
    @app_number = "+16176069516"
  end
end
