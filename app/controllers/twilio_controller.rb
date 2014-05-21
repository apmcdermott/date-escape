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

  def call
    if user_signed_in?
      @client.account.calls.create({
        :to => current_user.phone, # To escapee's number
        :from => @app_number, # From app's Twilio number
        # Fetch instructions from this URL when the call connects
        :url => call_handler_url,
        :method => 'GET',
        :fallback_method => 'GET',
        :status_callback_method => 'GET',
        :record => 'false'
      })
    else
      redirect_to new_user_session_path
    end
  end

  def call_handler
    say_message = current_user.messages.where(trigger: params[:body])
    response = Twilio::TwiML::Response.new do |r|
      r.Say "Testing testing blah blah", :voice => 'woman'
    end

    render_twiml response
  end

  def sms
    message = @client.account.messages.create(:body => "Test sent from Twilio controller",
      :from => @app_number,
      :to => "+16176508085",
    )
    render_twiml message
  end

  private

  def set_client
    @client = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end

  def set_twilio_number
    @app_number = "+16176069516"
  end
end
