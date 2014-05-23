# Date Escape
## Gracefully extricate yourself from any situation
===========

[http://date-escape.herokuapp.com](http://date-escape.herokuapp.com)

### Set up Twilio
What you'll need from Twilio: an account, phone number, SID, and auth token.
Sign up here: [http://twilio.com](http://twilio.com)

NOTE: Unless you have a paid account, you'll have to manually verify user phone numbers, and a test message will play before every call.

ALSO: There is no way to test Twilio functionality locally. You have to have some way for Twilio to reach the app over teh internets.

Go to your dashboard -> your Twilio number and enter in `http://your-app-url.com/process_sms` under "Messaging". Choose "HTTP GET" from the dropdown next to it.


### Set up your stuff

Put this in your `.env` file:
```ruby
# .env
TWILIO_SID=yourkey
TWILIO_AUTH_TOKEN=yourtoken
```

Set `@app_number` to *your* Twilio number in `app/controllers/twilio_controller.rb`:
```ruby
  def set_twilio_number
    @app_number = "+16176069516"
  end
```

Then run:
`rake db:migrate`
`rake db:seed`
