class TwilioController < ApplicationController
  include Webhookable

  # Disable CSRF detection to provide a POST endpoint to Twilio
  skip_before_action :verify_authenticity_token

  # Instantiate new client
  before_action :set_client

  # Instantiate From numer
  before_action :set_twilio_number

  # Set content type to xml for TwiML responses
  after_filter :set_header

  def index
    # View list of all SMS messages from user
    if user_signed_in?
      @message_data =
        @client.account.messages.list({ }).each do |message|
          {date_sent: message.date_sent, from: message.from, body: message.body}
        end
    else
      redirect_to root_path
    end
  end

  def call
    # to_number = params["To"]

    @client.account.calls.create({
      :to => '+16176508085', # To escapee's number
      :from => @app_number, # From app's Twilio number
      # Fetch instructions from this URL when the call connects
      :url => call_handler_path,
      :method => 'GET',
      :fallback_method => 'GET',
      :status_callback_method => 'GET',
      :record => 'false'
    })
  end

  def call_handler
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'Hey there. Congrats on integrating Twilio into your Rails 4 app.', :voice => 'woman'
    end

    render_twiml response
  end

  def sms
    message = @client.account.messages.create(:body => "Hi <3",
      :from => @app_number,
      :to => "+12154297996",
      :media_url => "http://www.example.com/hearts.png"
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
